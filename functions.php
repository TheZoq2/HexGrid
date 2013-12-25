<?php
	function getNeighbours($x, $y)
	{
		$neighbourPos = [
			[ [+1,  0], [ 0, -1], [-1, -1], [-1,  0], [-1, +1], [ 0, +1] ],
			[ [+1,  0], [+1, -1], [ 0, -1], [-1,  0], [ 0, +1], [+1, +1] ]
		];
		$result = array();

		$mod = $y % 2;
		for($i = 0; $i < count($neighbourPos[$mod]); $i++)
		{
			echo $i;
			$result[$i] = array();
			$result[$i][0] = $x + $neighbourPos[$mod][$i][0];
			$result[$i][1] = $y + $neighbourPos[$mod][$i][1];
		}
		return $result;
	}
?>