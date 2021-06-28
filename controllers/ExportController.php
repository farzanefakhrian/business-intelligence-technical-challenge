<?php

namespace App\Controllers;
use App\Core\App;

class ExportController{


    public function export(){

        $start_day=$_POST["start_day"];
        $end_day= $_POST["end_day"];

        $order_array= App::get('database')->get_orders_by_date($start_day,$end_day);



        $file_name = "orders_between_{$start_day}_{$end_day}.csv";
        header("Content-Disposition: attachment; filename=\"$file_name\"");
        header('Content-Encoding: UTF-8');
        header('Content-type: text/csv; charset=UTF-8');



        //To define column name in first row.
        $column_names = false;
        // run loop through each row in $customers_data
        foreach($order_array as $row) {
            if(!$column_names) {
                echo implode("\t", array_keys($row)) . "\n";
                $column_names = true;
            }


            array_walk($row, function ($row) {
                $row = preg_replace("/\t/", "\\t", $row);
                $row = preg_replace("/\r?\n/", "\\n", $row);
                if(strstr($row, '"')) $row = '"' . str_replace('"', '""', $row) . '"';
                return $row;
            });




            echo implode("\t", array_values($row)) . "\n";
        }
        exit;


    }
}