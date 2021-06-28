<?php

class QueryBuilder
{
    protected $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function selectAll($table)
    {
        $statement = $this->pdo->prepare("select * from {$table}");
        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_CLASS);
    }

    public function insert($table, $parameters)
    {
        $sql = sprintf(
          'insert into %s (%s) values (%s)',
          $table,
          implode(', ', array_keys($parameters)),
          ':' . implode(', :', array_keys($parameters))
        );

        try {
            $statement = $this->pdo->prepare($sql);
            $statement->execute($parameters);
        } catch (\Exception $e) {
            die("Whoops, something went wrong.");
        }
    }

    public function get_orders_by_date ($start, $end){
        $sql=sprintf("select order_table.order_id,
               order_table.order_time,
               user_table.user_name,
               user_table.user_phone_num,
               product_table.product_name,
               product_table.features,
               variant_table.variant_color,
               orderitems_table.count
            
            from order_table inner join user_table on order_table.user_id=user_table.user_id
            inner join orderitems_table on order_table.order_id = orderitems_table.order_id
            inner join variant_table on orderitems_table.variant_id = variant_table.variant_id
            inner join product_table on variant_table.product_id = product_table.product_id
            
            where order_table.order_time between '%s' AND '%s'
            order by order_table.order_time",
         $start,$end);
        $statement=$this->pdo->prepare($sql);

        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }
}