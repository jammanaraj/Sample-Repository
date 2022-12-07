$jar_list="C:\Users\rajj\Desktop\selected-jar-deploy\deploy_list.txt"
$total_jars="C:\Users\rajj\Desktop\selected-jar-deploy\test-jar\"

#folder check 
$name=Get-Date -Format "dd-MM-yyyy"
$z="C:\Users\rajj\Desktop\selected-jar-deploy\$name"
if(Test-Path $z){
 Remove-Item $z -Recurse -Force
 sleep 3
 mkdir "C:\Users\rajj\Desktop\selected-jar-deploy\$name"
}
else{
mkdir "C:\Users\rajj\Desktop\selected-jar-deploy\$name"
}

#copy selected jars
$select_jars="C:\Users\rajj\Desktop\selected-jar-deploy\$name"
$jars= Get-ChildItem $total_jars -Recurse | Select-Object Name
foreach($line in [System.IO.File]::ReadLines("$jar_list"))
{
        $check_jar= $jars |ForEach-Object{$_.Name -eq $line} 
         if($check_jar -eq $true )
         {
                Copy-Item $total_jars$line $select_jars -Force
         }
        else
        {
                Write-Host "no matching found"
        }

}



     