<?php

	//Nhúng file PHPExcel
	require_once 'PHPExcel/Classes/PHPExcel.php';

	//Đường dẫn file
	$file = 'data.xlsx';
	//Tiến hành xác thực file
	$objFile = PHPExcel_IOFactory::identify($file);
	$objData = PHPExcel_IOFactory::createReader($objFile);

	//Chỉ đọc dữ liệu
	$objData->setReadDataOnly(true);

	// Load dữ liệu sang dạng đối tượng
	$objPHPExcel = $objData->load($file);

	//Lấy ra số trang sử dụng phương thức getSheetCount();
	// Lấy Ra tên trang sử dụng getSheetNames();

	//Chọn trang cần truy xuất
	$sheet = $objPHPExcel->setActiveSheetIndex(0);

	//Lấy ra số dòng cuối cùng
	$Totalrow = $sheet->getHighestRow();
	//Lấy ra tên cột cuối cùng
	$LastColumn = $sheet->getHighestColumn();

	//Chuyển đổi tên cột đó về vị trí thứ, VD: C là 3,D là 4
	$TotalCol = PHPExcel_Cell::columnIndexFromString($LastColumn);

	//Tạo mảng chứa dữ liệu
	$data = [];


	//$table = $sheet->getCellByColumnAndRow(7, 0)->getValue();;
	//$dongKieuInt = $sheet->getCellByColumnAndRow(1,3)->getValue();

	//Tiến hành lặp qua từng ô dữ liệu
	//----Lặp dòng, Vì dòng đầu là tiêu đề cột nên chúng ta sẽ lặp giá trị từ dòng 2
	for ($i = 1; $i <= $Totalrow; $i++) {
	    //----Lặp cột
	    for ($j = 0; $j < $TotalCol; $j++) {
	        // Tiến hành lấy giá trị của từng ô đổ vào mảng
	        $data[$i - 2][$j] = $sheet->getCellByColumnAndRow($j, $i)->getValue();;
	    }
	}
	//Hiển thị mảng dữ liệu
	// echo '<pre>';
	// var_dump($data);
	$table = $data[-1][0];
	$cotCoNVarChar = explode(' ', $data[-1][1]);
	$cotLaSoInt = explode(' ', $data[-1][2]);
	$soCot = $data[-1][3];
	$cotLaNgay = explode(' ', $data[-1][4]);

	for($i = 1; $i < $Totalrow - 1; $i++)
	{
		$sql = "INSERT INTO ".$table." VALUES(";
		for($j = 0; $j < $soCot; $j++)
		{
			if($j == $soCot -1 )
			{
				if(laNVarChar($j, $cotCoNVarChar))
				{
					$sql .= " N'".$data[$i][$j]."'";
				}
				else if(laSoInt($j, $cotLaSoInt))
				{
					$sql .= " ".$data[$i][$j];
				}
				else if(laNgay($j, $cotLaNgay))
				{
					$unix_date = ($data[$i][$j] - 25569) * 86400;
					$sql .= " '".gmdate("Y-m-d", $unix_date)."'";
				}
				else
				{
					$sql .= " '".$data[$i][$j]."'";
				}
			}	
			else
			{
				if(laNVarChar($j, $cotCoNVarChar))
				{
					$sql .= " N'".$data[$i][$j]."',";
				}
				else if(laSoInt($j, $cotLaSoInt))
				{
					$sql .= " ".$data[$i][$j].",";
				}
				else if(laNgay($j, $cotLaNgay))
				{
					$unix_date = ($data[$i][$j] - 25569) * 86400;
					$sql .= " '".gmdate("Y-m-d", $unix_date)."',";
				}
				else
				{
					$sql .= " '".$data[$i][$j]."',";
				}
				

			}
				
		}
		$sql .= ")";
		echo $sql."</br>";
	}


	function laNVarChar($num, $cot)
	{
		foreach ($cot as $value) {
			if($value == $num)
				return true;
		}
		return false;
	}
	function laSoInt($num, $cot)
	{
		foreach ($cot as $value) {
			if($value == $num)
				return true;
		}
		return false;
	}

	function laNgay($num, $cot)
	{
		foreach ($cot as $value) {
			if($value == $num)
				return true;
		}
		return false;
	}
?>