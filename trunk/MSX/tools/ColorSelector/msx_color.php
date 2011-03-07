<?php

function GetParam($param, $default)
{
	if(isset($_GET[$param]))
		return $_GET[$param];
	else
		return $default;
}

$rSelect = GetParam("r", 7);
$gSelect = GetParam("g", 7);
$bSelect = GetParam("b", 3);
$selectCol = ($gSelect << 5) + ($rSelect << 2) + $bSelect;

?>
<html>
	<body style="font-family:monospace;">
    <h1>MSX Palette Selector</h1>
    <form>
      R: <select name="r"><?php for($i=0;$i<8;$i++) { print "<option value='$i'"; if($i==$rSelect) print " selected"; print ">$i</option>\n"; } ?></select>
      G: <select name="g"><?php for($i=0;$i<8;$i++) { print "<option value='$i'"; if($i==$gSelect) print " selected"; print ">$i</option>\n"; } ?></select>
      B: <select name="b"><?php for($i=0;$i<4;$i++) { print "<option value='$i'"; if($i==$bSelect) print " selected"; print ">$i</option>\n"; } ?></select>
      <input type="submit" value="Select" />
    </form>
    <table cellpadding="0" cellspacing="0" style='border-collapse:collapse;'>
      <tr>
        <?php
  $colNum = 16;
  $colBase = 8;
  for($j=0;$j<$colNum;$j++)
  {
      printf("<td style='border:none;'>x%.2f</td>\n", ($colNum - $j) / $colBase);
  }
  print "</tr><tr>\n";
  for($j=0;$j<$colNum;$j++)
  {
	    $colIdx = $i * 16 + $j;
      $r = min(7, floor($rSelect * ($colNum - $j) / $colBase));
      $g = min(7, floor($gSelect * ($colNum - $j) / $colBase));
      $b = min(3, floor($bSelect * ($colNum - $j) / $colBase));
      $r255 = floor($r * 255 / 7);
      $g255 = floor($g * 255 / 7);
      $b255 = floor($b * 255 / 3);
      $color = ($r255 << 16) + ($g255 << 8) + ($b255 << 0);
      $colStr = sprintf("%06X", $color);
      $textCol = ($r255 + $g255 + $b255) > 256 ? "black" : "white";
      $spanStyle = ($j == $colBase) ? "border:red solid 2px;" : "";
      print "<td style='border:black solid 1px; color:$textCol; background:#$colStr; padding:0.5em;'><span style='$spanStyle'>$colStr</span></td>\n";
  }
	      ?>
      </tr>
    </table>
    <br />
    <table cellpadding='0' cellspacing='0' style='border-collapse:collapse;'>
      <?php

for($i=0;$i<16;$i++)
{
    print "<tr>\n";
    for($j=0;$j<16;$j++)
    {
		    $colIdx = $i * 16 + $j;
	      $r = floor(($colIdx & 0x1C) / 4);
	      $g = floor($colIdx / 32);
	      $b = floor($colIdx & 0x03);
	      $r255 = floor($r * 255 / 7);
	      $g255 = floor($g * 255 / 7);
	      $b255 = floor($b * 255 / 3);
        $color = ($r255 << 16) + ($g255 << 8) + ($b255 << 0);
        $colStr = sprintf("%06X", $color);
        $textCol = ($r255 + $g255 + $b255) > 256 ? "black" : "white";
        $spanStyle = ($colIdx == $selectCol) ? "border:red solid 2px;" : "";
        print "<td style='border:black solid 1px; color:$textCol; background:#$colStr; padding:0.5em;'><span style='$spanStyle'>$colStr</span></td>\n";
    }
    print "</tr>\n";
}
	    ?>
    </table>
  </body>
</html>
