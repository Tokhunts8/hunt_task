<?php

abstract class baseModel
{
    protected $conn;
    protected $table;
    protected $select;
    protected $where;
    protected $order_by;
    protected $offset;
    protected $query;
    protected $result;
    protected $fields;
    protected $values;
    protected $join;
    protected $set;

    public function __construct()
    {
        $this->conn     = mysqli_connect('127.0.0.1 ', 'root', '', 'hunt_task');
        $this->table    = strtolower(get_called_class());
        $this->select   = '*';
        $this->where    = false;
        $this->order_by = '';
        $this->group_by = '';
        $this->limit    = '';
        $this->offset   = '';
        $this->fields   = '';
        $this->values   = '';
        $this->join   = '';
        $this->set      = '';
    }

    public function reset()
    {
        $this->select   = '*';
        $this->where    = false;
        $this->order_by = '';
        $this->group_by = '';
        $this->limit    = '';
        $this->offset   = '';
        $this->join   = '';
        $this->set      = '';
        return $this;
    }

    public function strposa($haystack, $needles = array(), $offset = 0)
    {
        $chr = array();
        foreach ($needles as $needle) {
            $res = stripos($haystack, $needle, $offset);
            if ($res !== false) {
                $chr[$needle] = $res;
            }
        }
        if (empty($chr)) {
            return false;
        }
        return true;
    }

    public function where($field, $value = false, $type = 'AND')
    {
        $arr   = ['!=', '>', '<'];
        $level = '=';
        if (!is_array($field) && is_string($field) && is_string($value)) {
            $fieldName         = $field;
            $field             = [];
            $field[$fieldName] = $value;
        }
        if (is_array($field)) {
            foreach ($field as $key => $val) {
                if ($this->strposa($key, $arr)) {
                    $level = '';
                }
                if ($this->where === false) {
                    $this->where = "WHERE `$key` $level '$val'";
                }
                else {
                    $this->where .= " $type `$key` $level '$val'";
                }
            }
        }

        return $this;
    }


    public function WhereIn($field, $values, $type = 'AND')
    {
        if (is_array($values)) {
            $values = implode(', ', $values);
        }
        if ($this->where === false) {
            $this->where = "WHERE `$field` ($values)";
        }
        else {
            $this->where .= " $type `$field` IN($values)";
        }

        return $this;

    }

    public function limit($limit)
    {
        $this->limit = "LIMIT $limit";
        return $this;
    }

    public function offset($offset)
    {
        $this->offset = "OFFSET $offset";
        return $this;
    }

    public function select($select)
    {
        $this->select = "$select";
        return $this;
    }

    public function orderBy($field, $value = '')
    {
        $this->order_by = "ORDER BY $field $value";
        return $this;
    }

    public function groupBy($field)
    {
        $this->group_by = "GROUP BY $field";
        return $this;
    }

    public function join($query)
    {
        $this->join = "$query";
        return $this;
    }

    public function get()
    {
        $this->query = "SELECT {$this->select} FROM `{$this->table}` {$this->join}";
        if ($this->where) {
            $this->query .= " $this->where";
        }
        $this->query  .= " $this->group_by $this->order_by $this->limit $this->offset";
        $this->result = mysqli_query($this->conn, $this->query);
        return $this;
    }

    public function result_array()
    {
        $this->reset();
        return mysqli_fetch_all($this->result, MYSQLI_ASSOC);
    }

    public function insert(array $params)
    {
        $this->fields = '(';
        $this->values = '(';
        foreach ($params as $key => $val) {
            $this->fields .= "`$key`, ";
            $this->values .= "'$val', ";
        }
        $this->values = rtrim($this->values, ', ');
        $this->fields = rtrim($this->fields, ', ');
        $this->fields .= ')';
        $this->values .= ')';
        $this->query  = "INSERT INTO `{$this->table}` {$this->fields} VALUES {$this->values}";
        $this->result = mysqli_query($this->conn, $this->query);
        $this->reset();
        return $this;
    }

    public function update(array $params)
    {
        foreach ($params as $key => $val) {
            $this->set .= "`$key` = '$val', ";
        }
        $this->set    = rtrim($this->set, ', ');
        $this->query  = "UPDATE `{$this->table}` SET {$this->set} {$this->where}";
        $this->result = mysqli_query($this->conn, $this->query);
        $this->reset();
        return $this;
    }

    public function selectCount()
    {
        $this->query  = "SELECT COUNT(*) FROM {$this->table}";
        $this->result = mysqli_query($this->conn, $this->query);
        return mysqli_fetch_row($this->result)[0];
    }

    public function beginTransaction()
    {
        $this->conn->begin_transaction();
        return $this;
    }

    public function commit()
    {
        $this->conn->commit();
        return $this;
    }

    public function rollback()
    {
        $this->conn->rollback();
        return $this;
    }

    public function truncate()
    {
        $this->query  = "TRUNCATE TABLE {$this->table}";
        $this->result = mysqli_query($this->conn, $this->query);
        return $this;
    }

    public function getById($id)
    {
        return $this->where('ID', $id)->get()->result_array();
    }
}
