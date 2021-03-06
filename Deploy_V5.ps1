#Lista de Servidores
$ListServerSite = @("11.11.57.5", "11.11.50.21", "11.11.50.22", "11.11.50.35", "11.11.50.36", "11.11.50.37", "11.11.50.38", "11.11.50.39", "11.11.50.40", "11.11.50.41", "11.11.50.31", "11.11.50.32", "11.11.50.44", "11.11.50.45", "11.11.50.46", "11.11.50.47", "11.11.50.48", "11.11.50.49", "11.11.50.50", "11.11.50.51", "11.11.50.52")
$ListServerLoja = @("11.11.60.176", "11.11.60.177", "11.11.60.179", "11.11.60.190", "11.11.60.191", "11.11.60.192", "11.11.60.193", "11.11.60.196", "11.11.60.197", "11.11.60.198", "11.11.60.199", "11.11.60.200", "11.11.60.201", "11.11.60.202", "11.11.60.203", "11.11.60.217", "11.11.60.218", "11.11.60.219", "11.11.60.220", "11.11.60.221")
$ListSSiteLoja = @($ListServerSite) + ($ListServerLoja)

#Diretório Aplicações
$EmailProcessing = "Inetpub\Servicos\Empresa\EmailProcessing"
$Framework  = "inetpub\Empresa\Framework"
$Interfacebuilder = "inetpub\servicos\Empresa\InterfaceBuilder"
$Orchestration = "inetpub\servicos\Empresa\Orchestration"
$TravelEngine = "inetpub\servicos\Empresa\TravelEngine"
$TravelManagement = "inetpub\servicos\Empresa\TravelManagement"
$UmbracoBin = "Inetpub\Empresa\UmbracoProd\bin"
$Umbraco = "Inetpub\Empresa\UmbracoProd"
$Api = "inetpub\Empresa\Empresa.Core.Api"
$Travel = "inetpub\Empresa\Travel"
$WebCommon = "inetpub\Empresa\WebCommon"

function Sair
{
    Exit
}

function Verifica
{
    Write-Host "Deseja realizar outra tarefa? digite (S) para Sim (N) para Não"
    $Resposta = read-host
    
    if ($Resposta -eq "S")
        {
            TipoDeploy
        } 
     Else
        {
            Sair
        }
}

#Backup Backup Caminho
function Backup_Caminho
{
    Write-Host "Favor, informar o caminho backup:"
    $global:CBackup = read-host
}
#Backup CoreApi
function Backup_CoreApi
{
    mkdir "$CBackup\Empresa.Core.Api\Site"
    mkdir "$CBackup\Empresa.Core.Api\Loja"     
    robocopy D:\$Api $CBackup\Empresa.Core.Api\Site /MIR /V /log+:D:\Temp\Empresa.Core.Api_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$Api $CBackup\Empresa.Core.Api\Loja /MIR /V /log+:D:\Temp\Empresa.Core.Api_LojaBackup.txt      
 }
 
#Backup Framework
function Backup_Framework
{
    mkdir "$CBackup\Framework\Site"
    mkdir "$CBackup\Framework\Loja"     
    robocopy D:\$Framework $CBackup\Framework\Site /MIR /V /log+:D:\Temp\Framework_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$Framework $CBackup\Framework\Loja /MIR /V /log+:D:\Temp\Framework_LojaBackup.txt      
 }
 
#Backup Travel
function Backup_Travel
{
    mkdir "$CBackup\Travel\Site"
    mkdir "$CBackup\Travel\Loja"     
    robocopy D:\$Travel $CBackup\Travel\Site /MIR /V /log+:D:\Temp\Travel_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$Travel $CBackup\Travel\Loja /MIR /V /log+:D:\Temp\Travel_LojaBackup.txt      
 }

#Backup Umbracobin
function Backup_Umbracobin
{
    mkdir "$CBackup\Umbraco\bin"
    mkdir "$CBackup\Umbraco\ConfigSite"
    mkdir "$CBackup\Umbraco\ConfigLoja"
    robocopy D:\$UmbracoBin $CBackup\Umbraco\bin /MIR /V /log+:D:\Temp\Umbraco_Backup.txt
    robocopy D:\$Umbraco $CBackup\Umbraco\ConfigSite web.config /V /log+:D:\Temp\Umbraco_SiteBackup.txt
    robocopy D:\$Umbraco $CBackup\Umbraco\ConfigLoja web.config /V /log+:D:\Temp\Umbraco_SiteBackup.txt
} 

#Backup WebCommon
function Backup_WebCommon
{
    mkdir "$CBackup\WebCommon\Site"
    mkdir "$CBackup\WebCommon\Loja"     
    robocopy D:\$WebCommon $CBackup\WebCommon\Site /MIR /V /log+:D:\Temp\WebCommon_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$WebCommon $CBackup\WebCommon\Loja /MIR /V /log+:D:\Temp\WebCommon_LojaBackup.txt      
 }

#Backup EmailProcessing
function Backup_EmailProcessing
{
    mkdir "$CBackup\EmailProcessing\Site"
    mkdir "$CBackup\EmailProcessing\Loja"     
    robocopy D:\$EmailProcessing $CBackup\EmailProcessing\Site /MIR /V /log+:D:\Temp\EmailProcessing_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$EmailProcessing $CBackup\EmailProcessing\Loja /MIR /V /log+:D:\Temp\EmailProcessing_LojaBackup.txt      
 }
 
#Backup InterfaceBuilder
function Backup_InterfaceBuilder
{
    mkdir "$CBackup\InterfaceBuilder\Site"
    mkdir "$CBackup\InterfaceBuilder\Loja"     
    robocopy D:\$Interfacebuilder $CBackup\InterfaceBuilder\Site /MIR /V /log+:D:\Temp\InterfaceBuilder_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$Interfacebuilder $CBackup\InterfaceBuilder\Loja /MIR /V /log+:D:\Temp\InterfaceBuilder_LojaBackup.txt      
 }
 
#Backup Orchestration
function Backup_Orchestration
{
    mkdir "$CBackup\Orchestration\Site"
    mkdir "$CBackup\Orchestration\Loja"     
    robocopy D:\$Orchestration $CBackup\Orchestration\Site /MIR /V /log+:D:\Temp\Orchestration_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$Orchestration $CBackup\Orchestration\Loja /MIR /V /log+:D:\Temp\Orchestration_LojaBackup.txt      
 }

#Backup TravelEngine
function Backup_TravelEngine
{
    mkdir "$CBackup\TravelEngine\Site"
    mkdir "$CBackup\TravelEngine\Loja"     
    robocopy D:\$TravelEngine $CBackup\TravelEngine\Site /MIR /V /log+:D:\Temp\TravelEngine_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$TravelEngine $CBackup\TravelEngine\Loja /MIR /V /log+:D:\Temp\TravelEngine_LojaBackup.txt      
 }
 
#Backup TravelManagement
function Backup_TravelManagement
{
    mkdir "$CBackup\TravelManagement\Site"
    mkdir "$CBackup\TravelManagement\Loja"     
    robocopy D:\$TravelManagement $CBackup\TravelManagement\Site /MIR /V /log+:D:\Temp\TravelManagement_SiteBackup.txt
    robocopy \\11.11.60.176\d$\$TravelManagement $CBackup\TravelManagement\Loja /MIR /V /log+:D:\Temp\TravelManagement_LojaBackup.txt      
 }
 
 
#CoreApi Site
function CoreApi
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Api \\$ServerSite\d$\$Api  /S /V /XF D:\$Api\Web.config /log+:D:\Temp\Empresa.Core.Api_Site.txt
            echo "Deploy Empresa.Core.Api servidor "$ServerSite
        }
}

#Framework Site
function Framework
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Framework \\$ServerSite\d$\$Framework  /S /V /XF D:\$Framework\Web.config /log+:D:\Temp\Framework_Site.txt
            echo "Deploy Framework servidor "$ServerSite
        }
}

#Travel Site
function Travel
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Travel \\$ServerSite\d$\$Travel /S /V /XF D:\$Travel\Web.config /log+:D:\Temp\Travel_Site.txt
            echo "Deploy Travel servidor "$ServerSite
        }
}

#Umbracobin Site
function Umbracobin
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$UmbracoBin \\$ServerSite\d$\$UmbracoBin  /S /V /log+:D:\Temp\UmbracoProd-bin_Site.txt
            echo "Deploy Umbraco bin servidor "$ServerSite
        }
}

#WebCommon Site
function WebCommon
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$WebCommon \\$ServerSite\d$\$WebCommon  /S /V /XF D:\$WebCommon\Web.config /log+:D:\Temp\Webcommon_Site.txt
            echo "Deploy WebCommon servidor "$ServerSite
        }
}

#EmailProcessing Site
function EmailProcessing
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$EmailProcessing \\$ServerSite\d$\$EmailProcessing /S /V /XF D:\$EmailProcessing\Web.config /log+:D:\Temp\EmailProcessing_Site.txt
            echo "Deploy EmailProcessing servidor "$ServerSite
        }
}

#InterfaceBuilder Site
function InterfaceBuilder
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Interfacebuilder \\$ServerSite\d$\$Interfacebuilder  /S /V /XF D:\$Interfacebuilder\Web.config /log+:D:\Temp\InterfaceBuilder_Site.txt
            echo "Deploy Interfacebuilder servidor "$ServerSite
        }
}

#Orchestration Site
function Orchestration
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Orchestration \\$ServerSite\d$\$Orchestration  /S /V /XF D:\$Orchestration\Web.config /log+:D:\Temp\Orchestration_Site.txt
            echo "Deploy Orchestration servidor "$ServerSite
        }
}

#TravelEngine Site
function TravelEngine
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$TravelEngine \\$ServerSite\d$\$TravelEngine  /S /V /XF D:\$TravelEngine\Web.config /log+:D:\Temp\TravelEngine_Site.txt
            echo "Deploy TravelEngine servidor "$ServerSite
        }
}

#TravelManagement Site
function TravelManagement
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$TravelManagement \\$ServerSite\d$\$TravelManagement  /S /V /XF D:\$TravelManagement\Web.config /log+:D:\Temp\TravelManagement_Site.txt
            echo "Deploy TravelManagement servidor "$ServerSite
        }
}

#CoreApi Loja
function CoreApi_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Api \\$ServerLoja\d$\$Api  /S /V /XF D:\$Api\Web.config /log+:D:\Temp\Empresa.Core.Api_Loja.txt
            echo "Deploy Empresa.Core.Api servidor "$ServerLoja
        }
}

#Framework Loja
function Framework_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Framework \\$ServerSite\d$\$Framework /S /V /XF D:\$Framework\Web.config /log+:D:\Temp\Framework_Loja.txt
            echo "Deploy Framework servidor "$ServerSite
        }
}

#Travel Loja
function Travel_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Travel \\$ServerLoja\d$\$Travel /S /V /XF D:\$Travel\Web.config /log+:D:\Temp\Travel_Loja.txt
            echo "Deploy Travel servidor "$ServerLoja
        }
}

#Umbracobin Loja
function Umbracobin_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$UmbracoBin \\$ServerLoja\d$\$UmbracoBin /S /V /log+:D:\Temp\UmbracoProdbin_Loja.txt
            echo "Deploy Umbraco bin servidor "$ServerLoja
        }
}

#WebCommon Loja
function WebCommon_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$WebCommon \\$ServerLoja\d$\$WebCommon /S /V /XF D:\$WebCommon\Web.config /log+:D:\Temp\Webcommon_Loja.txt
            echo "Deploy WebCommon servidor "$ServerLoja
        }
}

#EmailProcessing Loja
function EmailProcessing_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$EmailProcessing \\$ServerLoja\d$\$EmailProcessing /S /V /XF D:\$EmailProcessing\Web.config /log+:D:\Temp\EmailProcessing_Loja.txt
            echo "Deploy EmailProcessing servidor "$ServerLoja
        }
}

#InterfaceBuilder Loja
function InterfaceBuilder_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Interfacebuilder \\$ServerLoja\d$\$Interfacebuilder /S /V /XF D:\$Interfacebuilder\Web.config /log+:D:\Temp\InterfaceBuilder_Loja.txt
            echo "Deploy Interfacebuilder servidor "$ServerLoja
        }
}

#Orchestration Loja
function Orchestration_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Orchestration \\$ServerLoja\d$\$Orchestration /S /V /XF D:\$Orchestration\Web.config /log+:D:\Temp\Orchestration_Loja.txt
            echo "Deploy Orchestration servidor "$ServerLoja
        }
}

#TravelEngine Loja
function TravelEngine_Loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$TravelEngine \\$ServerLoja\d$\$TravelEngine /S /V /XF D:\$TravelEngine\Web.config /log+:D:\Temp\TravelEngine_Loja.txt
            echo "Deploy TravelEngine servidor "$ServerLoja
        }
}

#TravelManagement Loja
function TravelManagement_loja
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$TravelManagement \\$ServerLoja\d$\$TravelManagement /S /V /XF D:\$TravelManagement\Web.config /log+:D:\Temp\TravelManagement_Loja.txt
            echo "Deploy TravelManagement servidor "$ServerLoja
        }
}

#CoreApi Site_Loja
function CoreApi_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Api \\$ServerSL\d$\$Api /S /V /XF D:\$Api\Web.config /log+:D:\Temp\Empresa.Core.Api.txt
            echo "Deploy Empresa.Core.Api servidor "$ServerSL
        }
}

#Framework Site_Loja
function Framework_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Framework \\$ServerSL\d$\$Framework /S /V /XF D:\$Framework\Web.config /log+:D:\Temp\Framework.txt
            echo "Deploy Framework servidor "$ServerSL
        }
}

#Travel Site_Loja
function Travel_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Travel \\$ServerSL\d$\$Travel /S /V /XF D:\$Travel\Web.config /log+:D:\Temp\Travel.txt
            echo "Deploy Travel servidor "$ServerSL
        }
}

#Umbracobin Site_Loja
function Umbracobin_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$UmbracoBin \\$ServerSL\d$\$UmbracoBin /S /V /log+:D:\Temp\UmbracoProdbin.txt
            echo "Deploy Umbraco bin servidor "$ServerSL
        }
}

#WebCommon Site_Loja
function WebCommon_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$WebCommon \\$ServerSL\d$\$WebCommon /S /V /XF D:\$WebCommon\Web.config /log+:D:\Temp\Webcommon.txt
            echo "Deploy WebCommon servidor "$ServerSL
        }
}

#EmailProcessing Site_Loja
function EmailProcessing_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$EmailProcessing \\$ServerSL\d$\$EmailProcessing /S /V /XF D:\$EmailProcessing\Web.config /log+:D:\Temp\EmailProcessing.txt
            echo "Deploy EmailProcessing servidor "$ServerSL
        }
}

#InterfaceBuilder Site_Loja
function InterfaceBuilder_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Interfacebuilder \\$ServerSL\d$\$Interfacebuilder /S /V /XF D:\$Interfacebuilder\Web.config /log+:D:\Temp\InterfaceBuilder.txt
            echo "Deploy Interfacebuilder servidor "$ServerSL
        }
}

#Orchestration Site_Loja
function Orchestration_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Orchestration \\$ServerLoja\d$\$Orchestration /S /V /XF D:\$Orchestration\Web.config /log+:D:\Temp\Orchestration_Loja.txt
            echo "Deploy Orchestration servidor "$ServerLoja
        }
}

#TravelEngine Site_Loja
function TravelEngine_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$TravelEngine \\$ServerLoja\d$\$TravelEngine /S /V /XF D:\$TravelEngine\Web.config /log+:D:\Temp\TravelEngine_Loja.txt
            echo "Deploy TravelEngine servidor "$ServerLoja
        }
}

#TravelManagement Site_Loja
function TravelManagement_SL
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$TravelManagement \\$ServerLoja\d$\$TravelManagement /S /V /XF D:\$TravelManagement\Web.config /log+:D:\Temp\TravelManagement_Loja.txt
            echo "Deploy TravelManagement servidor "$ServerLoja
        }
}

#CoreApi Site_Config
function CoreApi_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Api \\$ServerSite\d$\$Api /S /V /log+:D:\Temp\Empresa.Core.Api_Site.txt
            echo "Deploy Empresa.Core.Api servidor "$ServerSite
        }
}

#Framework Site_Config
function Framework_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Framework \\$ServerSite\d$\$Framework /S /V /log+:D:\Temp\Framework_Site.txt
            echo "Deploy Framework servidor "$ServerSite
        }
}

#Travel Site_Config
function Travel_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Travel \\$ServerSite\d$\$Travel /S /V /log+:D:\Temp\Travel_Site.txt
            echo "Deploy Travel servidor "$ServerSite
        }
}

#Umbracobin Site_Config
function Umbracobin_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$UmbracoBin \\$ServerSite\d$\$UmbracoBin /S /V /log+:D:\Temp\UmbracoProd-bin_Site.txt
            robocopy D:\$Umbraco \\$ServerSite\d$\$Umbraco web.config /S /V /log+:D:\Temp\UmbracoProd-bin_Site.txt
            echo "Deploy Umbraco bin servidor "$ServerSite
        }
}

#WebCommon Site_Config
function WebCommon_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$WebCommon \\$ServerSite\d$\$WebCommon /S /V /log+:D:\Temp\Webcommon_Site.txt
            echo "Deploy WebCommon servidor "$ServerSite
        }
}

#EmailProcessing Site_Config
function EmailProcessing_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$EmailProcessing \\$ServerSite\d$\$EmailProcessing /S /V /log+:D:\Temp\EmailProcessing_Site.txt
            echo "Deploy EmailProcessing servidor "$ServerSite
        }
}

#InterfaceBuilder Site_Config
function InterfaceBuilder_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Interfacebuilder \\$ServerSite\d$\$Interfacebuilder /S /V /log+:D:\Temp\InterfaceBuilder_Site.txt
            echo "Deploy Interfacebuilder servidor "$ServerSite
        }
}

#Orchestration Site_Config
function Orchestration_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$Orchestration \\$ServerSite\d$\$Orchestration /S /V /XF D:\$Orchestration\Web.config /log+:D:\Temp\Orchestration_Site.txt
            echo "Deploy Orchestration servidor "$ServerSite
        }
}

#TravelEngine Site_Config
function TravelEngine_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$TravelEngine \\$ServerSite\d$\$TravelEngine /S /V /log+:D:\Temp\TravelEngine_Site.txt
            echo "Deploy TravelEngine servidor "$ServerSite
        }
}

#TravelManagement Site_Config
function TravelManagement_Config
{
    foreach ($ServerSite in $ListServerSite)
        {
            robocopy D:\$TravelManagement \\$ServerSite\d$\$TravelManagement /S /V /log+:D:\Temp\TravelManagement_Site.txt
            echo "Deploy TravelManagement servidor "$ServerSite
        }
}


#CoreApi Loja_Config
function CoreApi_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Api \\$ServerLoja\d$\$Api /S /V /log+:D:\Temp\Empresa.Core.Api_Loja.txt
            echo "Deploy Empresa.Core.Api servidor "$ServerLoja
        }
}

#Framework Loja_Config
function Framework_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Framework \\$ServerSite\d$\$Framework /S /V /log+:D:\Temp\Framework_Loja.txt
            echo "Deploy Framework servidor "$ServerSite
        }
}

#Travel Loja_Config
function Travel_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Travel \\$ServerLoja\d$\$Travel /S /V /log+:D:\Temp\Travel_Loja.txt
            echo "Deploy Travel servidor "$ServerLoja
        }
}

#Umbracobin Loja_Config
function Umbracobin_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$UmbracoBin \\$ServerLoja\d$\$UmbracoBin /S /V /log+:D:\Temp\UmbracoProdbin_Loja.txt
            robocopy D:\$Umbraco \\$ServerLoja\d$\$Umbraco web.config /S /V /log+:D:\Temp\UmbracoProdbin_Loja.txt
            echo "Deploy Umbraco bin servidor "$ServerLoja
        }
}

#WebCommon Loja_Config
function WebCommon_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$WebCommon \\$ServerLoja\d$\$WebCommon /S /V /log+:D:\Temp\Webcommon_Loja.txt
            echo "Deploy WebCommon servidor "$ServerLoja
        }
}

#EmailProcessing Loja_Config
function EmailProcessing_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$EmailProcessing \\$ServerLoja\d$\$EmailProcessing /S /V /log+:D:\Temp\EmailProcessing_Loja.txt
            echo "Deploy EmailProcessing servidor "$ServerLoja
        }
}

#InterfaceBuilder Loja_Config
function InterfaceBuilder_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Interfacebuilder \\$ServerLoja\d$\$Interfacebuilder /S /V /log+:D:\Temp\InterfaceBuilder_Loja.txt
            echo "Deploy Interfacebuilder servidor "$ServerLoja
        }
}

#Orchestration Loja_Config
function Orchestration_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$Orchestration \\$ServerLoja\d$\$Orchestration /S /V /log+:D:\Temp\Orchestration_Loja.txt
            echo "Deploy Orchestration servidor "$ServerLoja
        }
}

#TravelEngine Loja_Config
function TravelEngine_Loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$TravelEngine \\$ServerLoja\d$\$TravelEngine /S /V /log+:D:\Temp\TravelEngine_Loja.txt
            echo "Deploy TravelEngine servidor "$ServerLoja
        }
}

#TravelManagement Loja_Config
function TravelManagement_loja_Config
{
    foreach ($ServerLoja in $ListServerLoja)
        {
            robocopy D:\$TravelManagement \\$ServerLoja\d$\$TravelManagement /S /V /log+:D:\Temp\TravelManagement_Loja.txt
            echo "Deploy TravelManagement servidor "$ServerLoja
        }
}

#CoreApi Site_Loja_Config
function CoreApi_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Api \\$ServerSL\d$\$Api /S /V /log+:D:\Temp\Empresa.Core.Api.txt
            echo "Deploy Empresa.Core.Api servidor "$ServerSL
        }
}

#Framework Site_Loja_Config
function Framework_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Framework \\$ServerSL\d$\$Framework /S /V /log+:D:\Temp\Framework.txt
            echo "Deploy Framework servidor "$ServerSL
        }
}

#Travel Site_Loja_Config
function Travel_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Travel \\$ServerSL\d$\$Travel /S /V /log+:D:\Temp\Travel.txt
            echo "Deploy Travel servidor "$ServerSL
        }
}

#Umbracobin Site_Loja_Config
function Umbracobin_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$UmbracoBin \\$ServerSL\d$\$UmbracoBin /S /V /log+:D:\Temp\UmbracoProdbin.txt
            robocopy D:\$Umbraco \\$ServerSL\d$\$Umbraco web.config /S /V /log+:D:\Temp\UmbracoProdbin.txt
            echo "Deploy Umbraco bin servidor "$ServerSL
        }
}

#WebCommon Site_Loja_Config
function WebCommon_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$WebCommon \\$ServerSL\d$\$WebCommon /S /V /log+:D:\Temp\Webcommon.txt
            echo "Deploy WebCommon servidor "$ServerSL
        }
}

#EmailProcessing Site_Loja_Config
function EmailProcessing_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$EmailProcessing \\$ServerSL\d$\$EmailProcessing /S /V /log+:D:\Temp\EmailProcessing.txt
            echo "Deploy EmailProcessing servidor "$ServerSL
        }
}

#InterfaceBuilder Site_Loja_Config
function InterfaceBuilder_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Interfacebuilder \\$ServerSL\d$\$Interfacebuilder /S /V /log+:D:\Temp\InterfaceBuilder.txt
            echo "Deploy Interfacebuilder servidor "$ServerSL
        }
}

#Orchestration Site_Loja_Config
function Orchestration_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$Orchestration \\$ServerLoja\d$\$Orchestration /S /V /log+:D:\Temp\Orchestration_Loja.txt
            echo "Deploy Orchestration servidor "$ServerLoja
        }
}

#TravelEngine Site_Loja_Config
function TravelEngine_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$TravelEngine \\$ServerLoja\d$\$TravelEngine /S /V /log+:D:\Temp\TravelEngine_Loja.txt
            echo "Deploy TravelEngine servidor "$ServerLoja
        }
}

#TravelManagement Site_Loja_Config
function TravelManagement_SL_Config
{
    foreach ($ServerSL in $ListSSiteLoja)
        {
            robocopy D:\$TravelManagement \\$ServerLoja\d$\$TravelManagement /S /V /log+:D:\Temp\TravelManagement_Loja.txt
            echo "Deploy TravelManagement servidor "$ServerLoja
        }
}

function TipoDeploy
{
    Write-Host "############################################################################"
    Write-Host "####  Pressione 1 - Para deploy Site                                    ####"
    Write-Host "####  Pressione 2 - Para deploy Loja                                    ####"
    Write-Host "####  Pressione 3 - Para deploy Site e Loja                             ####"
    Write-Host "####  Pressione 4 - Para deploy Site(com Config)                        ####"
    Write-Host "####  Pressione 5 - Para deploy Loja(com Config rodar no NAPPWEB01)     ####"
    Write-Host "####  Pressione 6 - Para deploy Site e Loja(com Config)                 ####"
    Write-Host "####  Pressione 7 - Para realizar backup                                ####"
    Write-Host "####                                                                    ####"
    Write-Host "############################################################################"

    $TpDeploy = read-host

    if ($TpDeploy -eq 1)
        {
            $TD = 1
        }
        Elseif ($TpDeploy -eq 2)
            {
                $TD = 2    
            }
        Elseif ($TpDeploy -eq 3)
            {
                $TD = 3
            }
        Elseif ($TpDeploy -eq 4)
            {
                $TD = 4
            }
        Elseif ($TpDeploy -eq 5)
            {
                $TD = 5
            }
        Elseif ($TpDeploy -eq 6)
            {
                $TD = 6
            }
        Elseif ($TpDeploy -eq 7)
            {
                $TD = 7
            }    
    Else
        {
            Write-Host "Opção Invalida"
            Sair
        }

    function TipoAplicacao
        {
            Write-Host "#############################################################"
            Write-Host "####  Pressione 1 - Empresa.Core.Api                         ####"
            Write-Host "####  Pressione 2 - Framework                            ####"
            Write-Host "####  Pressione 3 - Travel                               ####"
            Write-Host "####  Pressione 4 - Umbraco                              ####"
            Write-Host "####  Pressione 5 - Webcommon                            ####"
            Write-Host "####  Pressione 6 - EmailProcessing                      ####"
            Write-Host "####  Pressione 7 - InterfaceBuilder                     ####"
            Write-Host "####  Pressione 8 - Orchestration                        ####"
            Write-Host "####  Pressione 9 - TravelEngine                         ####"
            Write-Host "####  Pressione 10 - TravelManagement                    ####"
            Write-Host "####  Pressione 11 - ALL Application                     ####"
            Write-Host "####                                                     ####"
            Write-Host "#############################################################"

            $TpAplicacao = read-host

            if ($TpAplicacao -eq 1)
                {
                    $TA = 1
                }
                Elseif ($TpAplicacao -eq 2)
                    {
                        $TA = 2
                    }
                Elseif ($TpAplicacao -eq 3)
                    {
                        $TA = 3
                    }
                Elseif ($TpAplicacao -eq 4)
                    {
                        $TA = 4
                    }
                Elseif ($TpAplicacao -eq 5)
                    {
                        $TA = 5
                    }
                Elseif ($TpAplicacao -eq 6)
                    {
                        $TA = 6
                    }
                Elseif ($TpAplicacao -eq 7)
                    {
                        $TA = 7
                    }
                Elseif ($TpAplicacao -eq 8)
                    {
                        $TA = 8
                    }
                Elseif ($TpAplicacao -eq 9)
                    {
                        $TA = 9
                    }
                Elseif ($TpAplicacao -eq 10)
                    {
                        $TA = 10
                    }
                Elseif ($TpAplicacao -eq 11)
                    {
                        $TA = 11
                    }
            Else
                {
                  Write-host "Opção Inválida"
                  Sair
                }
    #Write-Host $TD
    #Write-Host $TA
    
    #Iniciando robocopy Site
     if (($TD -eq 1) -and ($TA -eq 1))
        {   
            #Write-host "Valor Tipo Deploy " $TD
            #Write-host "Valor Tipo Aplicação " $TA
            #read-host
            CoreApi
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 2))
        {   
            Framework
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 3))
        {   
            Travel
        }
     if (($TD -eq 1) -and ($TA -eq 4))
        {   
            Umbracobin
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 5))
        {   
            WebCommon
            Verifica    
        }                  
     if (($TD -eq 1) -and ($TA -eq 6))
        {   
            EmailProcessing
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 7))
        {   
            InterfaceBuilder
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 8))
        {   
            Orchestration
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 9))
        {   
            TravelEngine
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 10))
        {   
            TravelManagement
            Verifica
        }
     if (($TD -eq 1) -and ($TA -eq 11))
        {   
            CoreApi
            Framework
            Travel
            Umbracobin
            WebCommon
            EmailProcessing
            InterfaceBuilder
            Orchestration
            TravelEngine
            TravelManagement
            Verifica
        }
        
     #Iniciando robocopy Loja
     if (($TD -eq 2) -and ($TA -eq 1))
        {   
            CoreApi_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 2))
        {   
            Framework_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 3))
        {   
            Travel_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 4))
        {   
            Umbracobin_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 5))
        {   
            WebCommon_Loja
            Verifica
        }                  
     if (($TD -eq 2) -and ($TA -eq 6))
        {   
            EmailProcessing_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 7))
        {   
            InterfaceBuilder_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 8))
        {   
            Orchestration_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 9))
        {   
            TravelEngine_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 10))
        {   
            TravelManagement_Loja
            Verifica
        }
     if (($TD -eq 2) -and ($TA -eq 11))
        {   
            CoreApi_Loja
            Framework_Loja
            Travel_Loja
            Umbracobin_Loja
            WebCommon_Loja
            EmailProcessing_Loja
            InterfaceBuilder_Loja
            Orchestration_Loja
            TravelEngine_Loja
            TravelManagement_Loja
            Verifica
        }
        
     #Iniciando robocopy Site e Loja
     if (($TD -eq 3) -and ($TA -eq 1))
        {   
            CoreApi_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 2))
        {   
            Framework_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 3))
        {   
            Travel_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 4))
        {   
            Umbracobin_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 5))
        {   
            WebCommon_SL
            Verifica
        }                  
     if (($TD -eq 3) -and ($TA -eq 6))
        {   
            EmailProcessing_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 7))
        {   
            InterfaceBuilder_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 8))
        {   
            Orchestration_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 9))
        {   
            TravelEngine_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 10))
        {   
            TravelManagement_SL
            Verifica
        }
     if (($TD -eq 3) -and ($TA -eq 11))
        {   
            CoreApi_SL
            Framework_SL
            Travel_SL
            Umbracobin_SL
            WebCommon_SL
            EmailProcessing_SL
            InterfaceBuilder_SL
            Orchestration_SL
            TravelEngine_SL
            TravelManagement_SL
            Verifica
        }
        
     #Iniciando robocopy Site com Config
     if (($TD -eq 4) -and ($TA -eq 1))
        {   
            CoreApi_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 2))
        {   
            Framework_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 3))
        {   
            Travel_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 4))
        {   
            Umbracobin_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 5))
        {   
            WebCommon_Config
            Verifica
        }                  
     if (($TD -eq 4) -and ($TA -eq 6))
        {   
            EmailProcessing_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 7))
        {   
            InterfaceBuilder_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 8))
        {   
            Orchestration_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 9))
        {   
            TravelEngine_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 10))
        {   
            TravelManagement_Config
            Verifica
        }
     if (($TD -eq 4) -and ($TA -eq 11))
        {   
            CoreApi_Config
            Framework_Config
            Travel_Config
            Umbracobin_Config
            WebCommon_Config
            EmailProcessing_Config
            InterfaceBuilder_Config
            Orchestration_Config
            TravelEngine_Config
            TravelManagement_Config
            Verifica
        }
        
     #Iniciando robocopy Loja com Config
     if (($TD -eq 5) -and ($TA -eq 1))
        {   
            CoreApi_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 2))
        {   
            Framework_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 3))
        {   
            Travel_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 4))
        {   
            Umbracobin_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 5))
        {   
            WebCommon_Loja_Config
            Verifica
        }                  
     if (($TD -eq 5) -and ($TA -eq 6))
        {   
            EmailProcessing_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 7))
        {   
            InterfaceBuilder_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 8))
        {   
            Orchestration_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 9))
        {   
            TravelEngine_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 10))
        {   
            TravelManagement_Loja_Config
            Verifica
        }
     if (($TD -eq 5) -and ($TA -eq 11))
        {   
            CoreApi_Loja_Config
            Framework_Loja_Config
            Travel_Loja_Config
            Umbracobin_Loja_Config
            WebCommon_Loja_Config
            EmailProcessing_Loja_Config
            InterfaceBuilder_Loja_Config
            Orchestration_Loja_Config
            TravelEngine_Loja_Config
            TravelManagement_Loja_Config
            Verifica
        }
        
    #Iniciando robocopy Site e Loja com Config
     if (($TD -eq 6) -and ($TA -eq 1))
        {   
            CoreApi_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 2))
        {   
            Framework_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 3))
        {   
            Travel_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 4))
        {   
            Umbracobin_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 5))
        {   
            WebCommon_SL_Config
            Verifica
        }                  
     if (($TD -eq 6) -and ($TA -eq 6))
        {   
            EmailProcessing_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 7))
        {   
            InterfaceBuilder_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 8))
        {   
            Orchestration_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 9))
        {   
            TravelEngine_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 10))
        {   
            TravelManagement_SL_Config
            Verifica
        }
     if (($TD -eq 6) -and ($TA -eq 11))
        {   
            CoreApi_SL_Config
            Framework_SL_Config
            Travel_SL_Config
            Umbracobin_SL_Config
            WebCommon_SL_Config
            EmailProcessing_SL_Config
            InterfaceBuilder_SL_Config
            Orchestration_SL_Config
            TravelEngine_SL_Config
            TravelManagement_SL_Config
            Verifica
        }
 
 
 
    #BACKUP APLICAÇÕES
     if (($TD -eq 7) -and ($TA -eq 1))
        {   
           Backup_Caminho
           Backup_CoreApi
           Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 2))
        {   
            Backup_Caminho
            Backup_Framework
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 3))
        {   
            Backup_Caminho
            Backup_Travel
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 4))
        {   
            Backup_Caminho
            Backup_Umbracobin
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 5))
        {   
            Backup_Caminho
            Backup_WebCommon
            Verifica
        }                  
     if (($TD -eq 7) -and ($TA -eq 6))
        {   
            Backup_Caminho
            Backup_EmailProcessing
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 7))
        {   
            Backup_Caminho
            Backup_InterfaceBuilder
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 8))
        {   
            Backup_Caminho
            Backup_Orchestration
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 9))
        {   
            Backup_Caminho
            Backup_TravelEngine
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 10))
        {   
            Backup_Caminho
            Backup_TravelManagement
            Verifica
        }
     if (($TD -eq 7) -and ($TA -eq 11))
        {   
            Backup_Caminho
            Backup_CoreApi
            Backup_Framework
            Backup_Travel
            Backup_Umbracobin
            Backup_WebCommon
            Backup_EmailProcessing
            Backup_InterfaceBuilder
            Backup_Orchestration
            Backup_TravelEngine
            Backup_TravelManagement
            Verifica
        }
               
        
                                                          
    #Fechando IF FUNCTION tipo APLICACAO
    }
    TipoAplicacao

#Fechando IF FUNCTION tipo DEPLOY
}
TipoDeploy

