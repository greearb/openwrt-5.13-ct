// SPDX-License-Identifier: GPL-2.0-only
/* Copyright (C) 2021 John Crispin <john@phrozen.org> */
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/notifier.h>
#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/platform_device.h>
#include <linux/reboot.h>
#include <linux/module.h>
#include <linux/gpio.h>
#include <linux/gpio/consumer.h>

static struct notifier_block edgecore_reboot_handler;
static struct gpio_desc *gpiod;
static int edgecore_reboot_handle(struct notifier_block *this,
					unsigned long mode, void *cmd)
{
	gpiod_direction_output(gpiod, 0);
	mdelay(1000);

	pr_emerg("Unable to restart system\n");
	return NOTIFY_DONE;
}

static int __init edgecore_reboot_probe(struct platform_device *pdev)
{
	int err;
        unsigned long flags = GPIOF_IN;

	gpiod = devm_gpiod_get_index(&pdev->dev, NULL, 0, flags);
        if (!IS_ERR(gpiod))
                gpiod_set_consumer_name(gpiod, "reboot");
	else
		return -EPROBE_DEFER;

	edgecore_reboot_handler.notifier_call = edgecore_reboot_handle;
	edgecore_reboot_handler.priority = 255;
	err = register_restart_handler(&edgecore_reboot_handler);
	if (err)
		printk("can't register restart notifier (err=%d)\n", err);


	return 0;
}

static const struct of_device_id edgecore_reboot_of_ids[] = {
	{ .compatible = "edgecore,reboot"},
	{ /* sentinel */ }
};


static struct platform_driver edgecore_reboot_driver = {
	.probe = edgecore_reboot_probe,
	.driver = {
		.name = "edgecore_reboot",
		.of_match_table = edgecore_reboot_of_ids,
	},
};

module_platform_driver(edgecore_reboot_driver);
