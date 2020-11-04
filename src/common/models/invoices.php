<?php

namespace invoices\common\models;

use data\model\model;
use data\model\modelInterface;

class invoices extends model implements modelInterface
{
    public $table = 'invoices';
    public $key   = 'invoice_id';
    public $dicionary = "SELECT invoice_id as value, consumer_id as label FROM invoices;";

    /**
     * Evento construtor da classe
     */
    public function __construct()
    {
        parent::__construct($this->getTable(), $this->getKey());
    }

    /**
     * Get the value of table
     */ 
    public function getTable()
    {
        return $this->table;
    }

    /**
     * Get the value of key
     */ 
    public function getKey()
    {
        return $this->key;
    }
}
?>