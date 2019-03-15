<?php
namespace Library\SSP;

class SSP
{
    public function data_output($get, $input, $search_text, $array_row = [])
    {
        $start = $get['start'];
        $length = $get['length'];
        $search = $get['search']['value'];
        $data = $input;
        if($search){
            $data = $data->andWhere($search_text,['search' => '%'.$search.'%']);
        }

        $count = $data
        ->getQuery()
        ->execute()
        ->count();

        $data = $data->limit($length)
        ->offset($start)
        ->getQuery()
        ->execute()
        ->toArray();

        $no = $start+1;
        foreach ($data as $key => $value) {
            $data[$key]['no'] = $no + $key;
            if(count($array_row)){
                $data[$key]['private'] = $array_row;
            }
        }

        return [
            'draw' => (int)$get['draw'],
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => $data,
        ];
    }
}
