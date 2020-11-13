<?php
namespace Library\SSP;

class SSP
{     
    public function dataOutput($_this, $input, $search_text, $array_row = [], $options = [])
    {
        $start = (int)$_this->request->get('start','int');
        $length = $_this->request->get('length','int');
        $search = $_this->request->get('search','int');
        $search = isset($search['value']) ? $search['value'] : '';
        $data = $input;
        if($search && !$search_text){
            $data = $data->andWhere($search_text,['search' => '%'.$search.'%']);
        }

        $count = $data
        ->getQuery()
        ->execute()
        ->count();

        if (!empty($options['extra'])) {
            $selectExtra = $options['extra'];
        }
        if (!empty($options['unlimit'])) {
            $data = $data->getQuery()
                ->execute();
        }else{
            $data = $data->limit($length)
                ->offset($start)
                ->getQuery()
                ->execute();
        }

        $no = $start+1;
        $res = [];
        foreach ($data as $key => $item) {
            $res[$key] = $item->toArray();
            $res[$key]['no'] = $no + $key;
            if(count($array_row)){
                $res[$key]['private'] = $array_row;
            }
            if (isset($selectExtra)) {
                foreach ($selectExtra as $kse => $valse) {
                    $res[$key][$kse] = $this->selectExtra($valse[0], $valse[1], $valse[2], $item->{$valse[3]});
                }
            }
        }

        return [
            'draw' => (int)$_this->request->get('draw','int'),
            'recordsTotal' => $count,
            'recordsFiltered' => $count,
            'data' => $res,
        ];
    }

    public function selectExtra($modelDst, $columnDst, $columnName, $valFind){
        $data = $modelDst::findFirst([
            'columns' => $columnName,
            'conditions' => "{$columnDst} = :coldst:",
            'bind' => ["coldst" => $valFind]
        ]);
        return $data ? $data->{$columnName} : '';
    }
}
