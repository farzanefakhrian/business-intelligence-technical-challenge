<?php


namespace App\Controllers;
use App\Core\App;
use App\Utils\SimpleXLSX;



class ImportController
{
    public $columns= [
        "user_table"=>["user_name","user_phone_num"],
        "variant_table"=>["variant_color","product_id"],
        "orderitems_table"=>["order_id","variant_id","count"],
        "order_table"=>["user_id","order_time"],
        "product_table"=>["product_name","features"]
    ];
    public function import()
    {
        if(isset($_POST["submit_file"]) and isset($_POST["tables"]))
        {
            $file = $_FILES["file"]["tmp_name"];
            $file_open = fopen($file,"r");
            $table=$_POST["tables"];
            $table_columns=$this->columns[$table];
            //var_dump($table_columns);

            if ( $xlsx = SimpleXLSX::parse($file) ) {
                $header_values = $rows = [];
                foreach ( $xlsx->rows() as $k => $r ) {
                    if ( $k === 0 ) {
                        $header_values = $r;
                        continue;
                    }
                    $rows[] = array_combine( $header_values, $r );

                }
                foreach ($rows as $row){
                    $values=[];
                    foreach ($table_columns as $table_column){
                        $values[$table_column]=$row[$table_column];
                    }


                    App::get('database')->insert($table, $values);

                }
            } else {
                echo SimpleXLSX::parseError();
            }


        }


        return redirect('');



    }






}