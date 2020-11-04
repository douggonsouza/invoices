<?php

namespace invoices\common\models;

use data\model\model;
use data\model\modelInterface;

class articles extends model implements modelInterface
{
    public $table = 'articles';
    public $key   = 'article_id';
    public $dicionary = "SELECT article_id as value, invoice_id as label FROM articles;";

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