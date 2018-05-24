:normal ma
:normal gg
:insert
/***************************************************************
 * File Name    :
 * Created By   : 
 * Creation Date:
 * Last Modified:
 * Description  :
 ****************************************************************/

.
:1,6s/File Name:.*/\='File Name:    ' . expand("%")
:1,6s/Creation Date:.*/\='Creation Date: ' .strftime("%Y-%m-%d")

:normal `a
