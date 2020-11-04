-- invoices

CREATE TABLE IF NOT EXISTS `heartwood`.`invoices` (
  `invoice_id` INT(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` INT(11) NOT NULL,
  `purchase_id` INT(11) NOT NULL,
  `status` ENUM('pending', 'paid', 'canceled') NOT NULL DEFAULT 'pending',
  `total_mount` DECIMAL(12,2) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`, `consumer_id`, `purchase_id`),
  INDEX `fk_invoices_purchases1_idx` (`purchase_id` ASC),
  INDEX `fk_invoices_consumers1_idx` (`consumer_id` ASC),
  CONSTRAINT `fk_invoices_purchases1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `heartwood`.`purchases` (`purchase_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_consumers1`
    FOREIGN KEY (`consumer_id`)
    REFERENCES `heartwood`.`consumers` (`consumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `heartwood`.`articles` (
  `article_id` INT(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `shipping_id` INT(11) NOT NULL,
  `shipping_value` DECIMAL(10,2) NULL,
  `value` DECIMAL(12,2) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`, `invoice_id`, `product_id`, `shipping_id`),
  INDEX `fk_assets_orders_idx` (`invoice_id` ASC),
  INDEX `fk_assets_products1_idx` (`product_id` ASC),
  INDEX `fk_articles_shippings1_idx` (`shipping_id` ASC),
  CONSTRAINT `fk_assets_orders`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `heartwood`.`invoices` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assets_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `heartwood`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_shippings1`
    FOREIGN KEY (`shipping_id`)
    REFERENCES `heartwood`.`shippings` (`shipping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;