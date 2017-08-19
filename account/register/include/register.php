<?php
/*
    Simultaneous Core Registration
    coded by Faded - www.EmuDevs.com
*/

    include('database.php');

    $player = $_POST['player'];
    $password = $_POST['password'];
    $email  = $_POST['email'];

    switch ($_POST['expansion'])
    {
        case "Classic":
            $tc_expansion = 0;
            $arc_expansion = 0;
            break;
        case "The Burning Crusade":
            $tc_expansion = 1;
            $arc_expansion = 8;
            break;
        case "Wrath of the Lich King":
            $tc_expansion = 2;
            $arc_expansion = 24;
            break;
        case "Cataclysm":
            $tc_expansion = 3;
            $arc_expansion = 32;
            break;
        case "Mists of Pandaria":
            $tc_expansion = 4;
            break;
    }

    $sha_pass = sha1(strtoupper($player) . ":" . strtoupper($password));

    if ($core_tc)
    {
        $result = $mysqli->select_db($db_tc);

        if (!$result)
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo '<BR />';
            echo "Selection Failed";
            echo '</div>';
            echo '</div>';
            trigger_error(mysqli_connect_errno(), E_USER_ERROR);
        }

        $tc_template = "INSERT INTO `" . $table_tc ."` (`username`, `sha_pass_hash`, `email`, `expansion`) VALUES ('" .
        $player . "','" . $sha_pass . "','" . $email . "'," . $tc_expansion. ")";

        $player_query = "SELECT * FROM `" . $table_tc . "` WHERE username='" . $player ."'";
        $playerResult = $mysqli->query($player_query);

        if (!$playerResult)
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo '<BR />';
            echo "Failed to execute!";
            echo '</div>';
            echo '</div>';
            trigger_error(mysqli_connect_errno(), E_USER_ERROR);
        }

        $row = mysqli_num_rows($playerResult);

        if ($row != 1)
        {
            $tc_result = $mysqli->query($tc_template);
            if (!$tc_result)
            {
                echo '<div id="container">';
                echo '<div id="content">';
                echo '<BR />';
                echo "Failed to execute!";
                echo '</div>';
                echo '</div>';
                trigger_error(mysqli_connect_errno(), E_USER_ERROR);
            }
            else
            {
                echo '<div id="container">';
                echo '<div id="content">';
                echo '<BR />';
                echo "Account '" . $player . "' has been created.";
                echo '</div>';
                echo '</div>';
            }
        }
        else
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo '<BR />';
            echo 'player exists';
            echo '</div>';
            echo '</div>';
        }
    }
    if ($core_arc)
    {
        $result = $mysqli->select_db($db_arc);

        if (!$result)
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo 'ArcEmu<BR />';
            echo "Selection Failed";
            echo '</div>';
            echo '</div>';
            trigger_error(mysqli_connect_errno(), E_USER_ERROR);
        }

        $arc_template = "INSERT INTO `" . $table_arc ."` (`login`, `encrypted_password`, `email`, `flags`) VALUES ('" .
        $player . "','" . $sha_pass . "','" . $email . "'," . $arc_expansion. ")";

        $player_query = "SELECT * FROM `" . $table_arc . "` WHERE login='" . $player ."'";
        $playerResult = $mysqli->query($player_query);

        if (!$playerResult)
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo 'ArcEmu<BR />';
            echo "Failed to execute!";
            echo '</div>';
            echo '</div>';
            trigger_error(mysqli_connect_errno(), E_USER_ERROR);
        }

        $row = mysqli_num_rows($playerResult);

        if ($row != 1)
        {
            $arc_result = $mysqli->query($arc_template);
            if (!$arc_result)
            {
                echo '<div id="container">';
                echo '<div id="content">';
                echo 'ArcEmu<BR />';
                echo "Failed to execute!";
                echo '</div>';
                echo '</div>';
                trigger_error(mysqli_connect_errno(), E_USER_ERROR);
            }
            else
            {
                echo '<div id="container">';
                echo '<div id="content">';
                echo 'ArcEmu<BR />';
                echo "Account '" . $player . "' created.";
                echo '</div>';
                echo '</div>';
            }
        }
        else
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo 'ArcEmu<BR />';
            echo 'player exists';
            echo '</div>';
            echo '</div>';
        }
    }
    if ($core_mang)
    {
        $result = $mysqli->select_db($db_mang);

        if (!$result)
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo 'MaNGOS<BR />';
            echo "Selection Failed";
            echo '</div>';
            echo '</div>';
            trigger_error(mysqli_connect_errno(), E_USER_ERROR);
        }

        $mang_template = "INSERT INTO `" . $table_mang ."` (`username`, `sha_pass_hash`, `email`, `expansion`) VALUES ('" .
        $player . "','" . $sha_pass . "','" . $email . "'," . $tc_expansion. ")";

        $player_query = "SELECT * FROM `" . $table_mang . "` WHERE username='" . $player ."'";
        $playerResult = $mysqli->query($player_query);

        if (!$playerResult)
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo 'MaNGOS<BR />';
            echo "Failed to execute!";
            echo '</div>';
            echo '</div>';
            trigger_error(mysqli_connect_errno(), E_USER_ERROR);
        }

        $row = mysqli_num_rows($playerResult);

        if ($row != 1)
        {
            $mang_result = $mysqli->query($mang_template);
            if (!$mang_result)
            {
                echo '<div id="container">';
                echo '<div id="content">';
                echo 'MaNGOS<BR />';
                echo "Failed to execute!";
                echo '</div>';
                echo '</div>';
                trigger_error(mysqli_connect_errno(), E_USER_ERROR);
            }
            else
            {
                echo '<div id="container">';
                echo '<div id="content">';
                echo 'MaNGOS<BR />';
                echo "Account '" . $player . "' created.";
                echo '</div>';
                echo '</div>';
            }
        }
        else
        {
            echo '<div id="container">';
            echo '<div id="content">';
            echo 'MaNGOS<BR />';
            echo 'player exists';
            echo '</div>';
            echo '</div>';
        }
    }
    if (!$core_tc && !$core_arc && !$core_mang)
    {
        echo '<div id="container">';
        echo '<div id="content">';
        echo 'No cores enabled in config.';
        echo '</div>';
        echo '</div>';
    }

    $mysqli->close();