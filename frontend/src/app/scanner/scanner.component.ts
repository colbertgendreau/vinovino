import { Component, ElementRef, OnDestroy, ViewChild, Output, EventEmitter } from '@angular/core';
import { Imesbouteilles } from '../imesbouteilles';
import { environment } from '../../environments/environment';
import { FetchService } from '../fetch.service';
import { Router } from '@angular/router';
import Quagga from 'quagga';

@Component({
  selector: 'app-scanner',
  templateUrl: './scanner.component.html',
  styleUrls: ['./scanner.component.scss']
})
export class ScannerComponent implements OnDestroy {
  @ViewChild('video') video: ElementRef;
  @ViewChild('canvas') canvas: ElementRef;
  isScanning = false;
  backCameraList = [];
  uneBouteille: Imesbouteilles;
  private stream: MediaStream | null = null;
  iconeCamera =  environment.baseImg + 'icones/barcode-scan.png';
  iconeX =  environment.baseImg + 'icones/x.png';

  errorMessage: string = '';
  front_back_camera = "environment";

  @Output() scanned = new EventEmitter<any>();
  showVideo = false;

  constructor(
    public fetchService: FetchService,
    private router: Router
  ) {}


  ngOnInit(): void {
    //console.log('apenas');
    // Pour Android
    navigator.mediaDevices.enumerateDevices()
      .then((devices) => {
        console.log('aqui');
        devices.forEach((device) => {
          //alert('device - ' + JSON.stringify(device));
          if ( device.kind === 'videoinput' && device.label.match(/ack/) != null ) {
            //alert('Camera derrière trouvé found! - ' + device.label);
            console.log('deviceId: ', device.deviceId);
            this.backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
          }else if ( device.kind === 'videoinput' && device.label.match(/HD/) != null ) {
            //alert('Web cam trouvé! - ' + device.label);
            this.front_back_camera = "user";
            console.log('deviceId: ', device.deviceId);
            this.backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
          }
        });

        if (this.backCameraList.length === 0) {
          navigator.mediaDevices.getUserMedia({video: {
              facingMode: { exact: this.front_back_camera }
            } })
            .then((stream) => {
              this.stream = stream;
              navigator.mediaDevices.enumerateDevices()
                .then((devices) => {
                  devices.forEach((device) => {
                    //alert('device2 - ' + JSON.stringify(device));
                    if ( device.kind === 'videoinput' && device.label.match(/ack/) != null ) {
                      //alert('Back2 found! - ' + device.label);
                      console.log('deviceId: ', device.deviceId);
                      this.backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
                    }else if ( device.kind === 'videoinput' && device.label.match(/arri/) != null ) {
                      //alert('Caméra arrière trouvé! - ' + device.label);
                      console.log('deviceId: ', device.deviceId);
                      this.backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
                    }
                    else if ( device.kind === 'videoinput' && device.label.match(/\u540E\u7F6E\u76F8\u673A/) != null ) {
                      //alert('Caméra \u540E\u7F6E\u76F8\u673A trouvé! - ' + device.label);
                      console.log('deviceId: ', device.deviceId);
                      this.backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
                    }
                  });
                })
            });
        }
      });



    //console.log(this.backCameraList);
    //console.log('fin')
  }


  startScan(): void {
    this.showVideo = true;

    if (this.backCameraList.length === 0) {

      //ios?

      this.stopScan();
      this.errorMessage = "Aucune caméra utilisable n'a été détectée, cette fonction n'est utilisable que sur mobile.";
      this.showVideo = false;
      return;
    }


    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
      navigator.mediaDevices.getUserMedia({video: {
          deviceId: { exact: this.backCameraList[this.backCameraList.length - 1]['deviceId'] },
          facingMode: { exact: this.front_back_camera }
        } })
        .then((stream) => {
          this.stream = stream;
          this.video.nativeElement.srcObject = stream;
          this.video.nativeElement.autoplay = true;
          this.video.nativeElement.playsInline = true;
          this.video.nativeElement.muted = true;
          this.isScanning = true;
          Quagga.init({
            inputStream: {
              name: "Live",
              type: "LiveStream",
              target: this.video.nativeElement,
              constraints: {
                width: 640,
                height: 480,
                facingMode: { exact: this.front_back_camera },
                deviceId: this.backCameraList[this.backCameraList.length - 1]['deviceId']
              },
              area: {
                top: "25%",
                right: "10%",
                left: "10%",
                bottom: "25%"
              },
              singleChannel: false // true: only the red color-channel is read
            },
            decoder: {
              readers: ["ean_reader", "upc_reader","code_128_reader"],
              debug: {
                drawBoundingBox: true,
                showFrequency: true,
                drawScanline: true,
                showPattern: true
              }
            },
            locate: true,
            locator: {
              halfSample: false,
              patchSize: "large"
            },
            debug:true
          }, (err) => {
            if (err) {
              console.error(err);
              return;
            }
            Quagga.start();
            Quagga.onProcessed(function(result) {
              var drawingCtx = Quagga.canvas.ctx.overlay,
                drawingCanvas = Quagga.canvas.dom.overlay;

              if (result) {
                if (result.boxes) {
                  drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
                  result.boxes.filter(function (box) {
                    return box !== result.box;
                  }).forEach(function (box) {
                    Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: "green", lineWidth: 2});
                  });
                }

                if (result.box) {
                  Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: "#00F", lineWidth: 2});
                }

                if (result.codeResult && result.codeResult.code) {
                  Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3});
                }
              }
            });
            this.isScanning = true;
          });
        })
        .catch((err) => {
          console.error(err);
        });
    }
  }

  stopScan(): void {
    if (this.stream) {
      this.stream.getTracks().forEach((track) => {
        track.stop();
      });
    }
    this.video.nativeElement.pause();
    this.video.nativeElement.srcObject = null;
    Quagga.stop();
    this.isScanning = false;
    this.showVideo = false;
  }

  ngOnDestroy(): void {
    if(this.showVideo == true || this.isScanning == true){
      this.stopScan();
    }
  }

  // ngOnInit(): void {
  //   navigator.mediaDevices.enumerateDevices()
  //     .then((devices) => {
  //       devices.forEach((device) => {
  //         if (device.kind === 'videoinput') {
  //           console.log('Camera found:', device.label);
  //         }
  //       });
  //     });
  // }

  // startScan(): void {
  //   this.showVideo = true;
  //   if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
  //     navigator.mediaDevices.getUserMedia({video: { facingMode: { exact: 'environment' } } })
  //       .then((stream) => {
  //         this.stream = stream;
  //         this.video.nativeElement.srcObject = stream;
  //         this.video.nativeElement.play();
  //         this.isScanning = true;
  //         Quagga.init({
  //           inputStream: {
  //             name: "Live",
  //             type: "LiveStream",
  //             target: this.video.nativeElement,
  //             constraints: {
  //               facingMode: { exact: "environment" }
  //             },
  //             area: {
  //               top: "25%",
  //               right: "10%",
  //               left: "10%",
  //               bottom: "25%"
  //             },
  //             singleChannel: false // true: only the red color-channel is read
  //           },
  //           decoder: {
  //             readers: ["ean_reader", "upc_reader","code_128_reader"]
  //           },
  //           locate: true,
  //           locator: {
  //             halfSample: false,
  //             patchSize: "large"
  //           },
  //           debug:true
  //         }, (err) => {
  //           if (err) {
  //             console.error(err);
  //             return;
  //           }
  //           Quagga.start();
  //           this.isScanning = true;
  //         });
  //       })
  //       .catch((err) => {
  //         console.error(err);
  //       });
  //   }
  // }

  // stopScan(): void {
  //   if (this.stream) {
  //     this.stream.getTracks().forEach((track) => {
  //       track.stop();
  //     });
  //   }
  //   this.video.nativeElement.pause();
  //   this.video.nativeElement.srcObject = null;
  //   Quagga.stop();
  //   this.isScanning = false;
  //   this.showVideo = false;
  // }

  // ngOnDestroy(): void {
  //   this.stopScan();
  // }



  handleDecode(result: any): void {
    // const drawingCtx = this.canvas.nativeElement.getContext('2d');
    // let box = [];
    // if (result.codeResult.hasOwnProperty('box')) {
    //   box = result.codeResult.box;
    //   drawingCtx.strokeStyle = 'blue';
    //   drawingCtx.lineWidth = 5;
    //   drawingCtx.strokeRect(box[0], box[1], box[2] - box[0], box[3] - box[1]);
    // }
    console.log(result.codeResult.code);


    if(result.codeResult.code.length === 11){
      result.codeResult.code = "000"+result.codeResult.code
      console.log("ce code est 11");
      console.log(result.codeResult.code);
    }
    if(result.codeResult.code.length === 12){
      result.codeResult.code = "00"+result.codeResult.code
      console.log("ce code est 12");
      console.log(result.codeResult.code);
    }
    if(result.codeResult.code.length === 13){
      result.codeResult.code = "0"+result.codeResult.code
      console.log("ce code est 13");
      console.log(result.codeResult.code);
    }
    this.stopScan();



    this.fetchService.scannerDetail(result.codeResult.code).subscribe((data: any) => {
      this.uneBouteille = data.data;
      // if(!this.uneBouteille){
      //   this.startScan();
      // }
      console.log(this.uneBouteille);

      this.scanned.emit(this.uneBouteille);


    });



  }

  ngAfterViewInit(): void {
    Quagga.onDetected(this.handleDecode.bind(this));
  }



}
