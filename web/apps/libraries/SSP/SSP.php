<?php
namespace Library\SSP;

class SSP
{
    public function data_output($get, $input, $search_text, $array_row = [])
    {
        $start = isset($get['start']) ? $get['start'] : 0 ;
        $length = isset($get['length']) ? (int)$get['length'] : 0;
        $search = isset($get['search']['value']) ? $get['search']['value'] : false ;
        $data = $input;
        if($search){
            $data = $data->andWhere($search_text,['search' => '%'.$search.'%']);
        }

        $count = $data
        ->getQuery()
        ->execute()
        ->count();

        if($length > 0){
            $data = $data->limit($length);
        }

        $data = $data->offset($start)
        ->getQuery()
        ->execute()
        ->toArray();

        $no = $start + 1;
        foreach ($data as $key => $value) {
            $data[$key]['no'] = $no + $key;
            if(count($array_row)){
                $data[$key]['private'] = $array_row;
            }
        }

        return [
            'draw' => isset($get['draw']) ? (int)$get['draw'] : 0,
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => $data,
        ];
    }
}
