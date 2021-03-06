/*
Jaunary 2018
This file is created by nextsigner
This code is used for the unik qml engine system too created by nextsigner.
Please read the Readme.md from https://github.com/nextsigner/rickypapi.git
Contact
    email: nextsigner@gmail.com
    whatsapps: +54 11 3802 4370
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import QtWebEngine 1.4
ApplicationWindow {
    id:app
    visible: true
    width: 1400
    height: 600
    visibility:"Maximized"
    title: 'FutuRock Navegador Web'
    color: '#333'
    property int fs: app.width*0.02
    property color c1: "#1fbc05"
    property color c2: "#4fec35"
    property color c3: "white"
    property color c4: "black"
    property color c5: "#333333"
    property string tool: ""


    property string urlYT: 'https://www.futurock.fm/'
    property string urlInst: 'https://www.instagram.com/futurockok/'
    property string urlTT: 'https://twitter.com/futurockok?lang=es'
    property string urlFB: 'https://www.facebook.com/FuturockOk/'
    property string urlRC: 'https://radiocut.fm/radiostation/futurock/listen/'

    property string colorBarra:'white'

    onClosing: {
        //close.accepted = false
        engine.load(appsDir+'/unik-tools/main.qml')
    }

    Settings{
        id: appSettings
        category: 'conf-futurock'
        property string bgColorEditor: 'black'
        property string txtColorEditor: 'white'
        property int pyLineRH1: 0
        property bool dlvVisible: false
        property string currentFolder
        property string uUrlYT: app.urlYT
        property string uUrlInst: app.urlInst
        property string uUrlTT: app.urlTT
        property string uUrlFB: app.urlFB
        property string uUrlRC: app.urlRC
        property int red: 0
        property string uRS: ''
        property bool uRCRev: false
    }
    FontLoader {name: "FontAwesome";source: "qrc:/fontawesome-webfont.ttf";}
    Row{
        anchors.fill: parent
        Rectangle{
            id: xTools
            width: app.width*0.02
            height: app.height
            color: "#fff"
            z:container.z+99999
            Rectangle{
                width: 1
                height: parent.height
                color: "black"
                anchors.right: parent.right
            }
            Column{
                id: colTools
                width: parent.width
                spacing:  width*0.5
                anchors.verticalCenter: parent.verticalCenter
                Boton{
                    id: btnYutun
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t: ""
                    d:'www.futurock.fm'

                    a: appSettings.red===0
                    c: 'black'
                    b: 'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    Image {
                        id: imgbnt1
                        width: parent.width
                        height: width
                        opacity: appSettings.red===1?1.0:0.5
                        source: "https://www.futurock.fm/sites/default/files/media/image/futurock_default_preview.jpg"
                    }
                    onClicking: {
                        appSettings.red=0;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlYT = app.urlYT
                            modwvyutun.url=appSettings.uUrlYT
                            appSettings.red=0;
                        }
                    }
                }
                Boton{
                    id: btnInstagram
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w

                    t: modwvig.url.indexOf(app.urlInst)===0?"\uf16d":"\uf0ac"
                    d:'www.instagram.com/futurockok'

                    a: appSettings.red===1
                    c: a?'white':'blue'
                    b: a?'blue':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=1;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlInst = app.urlInst
                            modwvig.url=appSettings.uUrlInst
                            appSettings.red=1;
                        }
                    }
                }
                Boton{
                    id: btnTwitter
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t: modwvtt.url.indexOf(app.urlTT)===0?"\uf099":"\uf0ac"
                    d:'www.twitter.com/futurockok'

                    a: appSettings.red===2
                    c: a?'white':'#43b7f1'
                    b: a?'#43b7f1':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=2;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlTT = app.urlTT
                            modwvtt.url=appSettings.uUrlTT
                            appSettings.red=2;
                        }
                    }
                }
                Boton{
                    id: btnFacebook
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t: modwvfb.url.indexOf(app.urlFB)===0?"\uf09a":"\uf0ac"
                    d:'www.facebook.com/FutuRockOk'

                    a: appSettings.red===3
                    c: a?'white':'#117aca'
                    b: a?'#117aca':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=3;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlFB = app.urlFB
                            modwvfb.url=appSettings.uUrlFB
                            appSettings.red=3;
                        }
                    }
                }
                Boton{
                    id: btnRadioCut
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t:""
                    d:'www.radiocut.com/futurock'
                    Text {
                        id: lrc
                        text: "<b>RC</b>"
                        font.pixelSize: parent.width*0.5
                        anchors.centerIn: parent
                        color: parent.a?'white':'#58ACFA'
                    }                    a: appSettings.red===4
                    b: a?'#58ACFA':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=4;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlRC = app.urlRC
                            modwvrc.url=appSettings.uUrlRC
                            appSettings.red=4;
                        }
                    }
                }
                Item{width: parent.width*0.9;height: width}
                Item{width: parent.width*0.9;height: width}
                Boton{
                    id: btnDLV
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    t: "\uf019"
                    d:'Ver panel de Descargas'

                    a: appSettings.dlvVisible
                    c: a?'white':'green'
                    b: a?'green':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.dlvVisible = !appSettings.dlvVisible
                    }
                }

                Boton{
                    id: btnInfo
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    t: modwvinfo.url.indexOf("https://twitter.com/hashtag/FutuRockNavegadorWeb?src=hash")===0?"\uf086":"\uf0ac"
                    d:'Ver información sobre este navegador.'

                    a: appSettings.red===5
                    c: a?'white':'green'
                    b: a?'green':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        modwvinfo.url = "https://twitter.com/hashtag/FutuRockNavegadorWeb?src=hash"
                        appSettings.red=5;
                    }
                }
                Item{width: parent.width*0.9;height: width}
                Item{width: parent.width*0.9;height: width}
                Boton{
                    id: btnUpdate
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    b: up ? 'red':'#ccc'
                    c: up ? 'white':'#333'
                    t: "\uf021"
                    d:'Actualizar el código fuente del navegador desde GitHub.com'
                    o:1.0
                    r:app.fs*0.2
                    property bool up: false
                    onClicking: {
                        if(!btnUpdate.up){
                            btnUpdate.enabled=false
                            var fd=unik.getPath(3)+'/unik'
                            var downloaded = unik.downloadGit('https://github.com/nextsigner/futurock', fd)
                            btnUpdate.enabled=true;
                            if(downloaded){
                                unik.restartApp()
                            }
                        }else{
                            //appSettings.uRS=app.uRSStandBy
                            unik.restartApp()
                        }
                    }
                }
                Boton{
                    id: btnApagar
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    t: "\uf011"
                    d:'Apagar (Al hacer click en el timer central se vuelve a unik)'

                    c: '#333'
                    b: '#fff'
                    o: 1.0
                    r:app.fs*0.2

                    onClicking: Qt.quit()
                    onPChanged:{
                        if(p){
                            app.close()
                        }
                    }

                }

            }
        }

        Rectangle{
            id:container
            width: parent.width
            height: parent.height
            color: '#333'

            ModWebView{id:modwvyutun;red:0;url:appSettings.uUrlYT;}
            ModWebView{id:modwvig;red:1;url:appSettings.uUrlInst;}
            ModWebView{id:modwvtt;red:2;url:appSettings.uUrlTT;}
            ModWebView{id:modwvfb;red:3;url:appSettings.uUrlFB;}
            ModWebView{id:modwvrc;red:4;url:appSettings.uUrlRC;}
            ModWebView{id:modwvinfo;red:5;url:"https://twitter.com/hashtag/FutuRockNavegadorWeb?src=hash";}
            LineResizeH{
                id:lineRH;
                y:visible?appSettings.pyLineRH1: parent.height;
                onLineReleased: appSettings.pyLineRH1 = y;
                visible: appSettings.dlvVisible;
                onYChanged: {
                    if(y<container.height/3){
                        y=container.height/3+2
                    }
                }
                Component.onCompleted: {
                    if(lineRH.y<container.height/3){
                        lineRH.y=container.height/3+2
                    }
                }
            }
            ModDLV{
                id: modDlv
                width: parent.width
                anchors.top: lineRH.bottom;
                anchors.bottom: parent.bottom;
                visible: appSettings.dlvVisible;
            }
        }
    }


    Timer{
        id:tu
        running: true
        repeat: false
        interval: 1000*5
        property int v: 0
        onTriggered: {
            tu.v++
            var d = new Date(Date.now())
            unik.setDebugLog(false)
            var ur0 = ''+unik.getHttpFile('https://github.com/nextsigner/rickypapi/commits/master?r='+d.getTime())
            var m0=ur0.split("commit-title")
            var m1=(''+m0[1]).split('</p>')
            var m2=(''+m1[0]).split('\">')
            var m3=(''+m2[2]).split('<')
            var ur = ''+m3[0]
            if(appSettings.uRS===''){
                appSettings.uRS=ur
            }
            //unik.log("Update key control nª"+tu.v+": "+ur+" urs: "+appSettings.uRS)
            if(appSettings.uRS!==ur){
                unik.setDebugLog(true)
                unik.log("Updating unik-tools")
                appSettings.uRS = ur
                var fd=appsDir
                var downloaded = unik.downloadGit('https://github.com/nextsigner/rickypapi', fd)
                appSettings.uRS=''
                tu.stop()
                if(downloaded){
                    btnUpdate.up=true
                }else{
                    tu.start()
                }
            }
            unik.setDebugLog(true)
            tu.interval=1000*60*5
            tu.repeat=true
            tu.start()
        }
    }
    function onDLR(download) {
        appSettings.dlvVisible=true
        modDlv.append(download);
        download.accept();
    }

    Component.onCompleted:  {
        unik.debugLog = true
    }
}
