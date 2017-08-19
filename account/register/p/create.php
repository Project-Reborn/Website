<?php
/*
    Simultaneous Core Registration
    coded by Faded - www.EmuDevs.com
*/
?>
<div id="container">
    <div id="content">
        <form id="register" method="post" action="?p=register">
            <fieldset>
                
                <center>
                    <label>Player Name: </label><BR />
                    <input type="text" name="player" class="rounded"><BR /><BR />
                    <label>Password: </label><BR />
                    <input type="password" name="password" class="rounded"<BR /><BR /><BR />
                    <label>E-Mail: </label><BR />
                    <input type="text" name="email" class="rounded"><BR /><BR />
                    <label>Expansion: </label><BR />
                    <select name="expansion" class="rounded">
                        <option>Classic</option>
                        <option>The Burning Crusade</option>
                        <option selected>Wrath of the Lich King</option>
                        <option>Cataclysm</option>
                        <option>Mists of Pandaria</option>
                    </select><BR /><BR />
                    <input type="submit" value="Register" class="rounded">
                    <input type="button" value="Clear" class="rounded" onclick="formReset()">
                </center>
            </fieldset>
        </form>

    </div>
</div>
