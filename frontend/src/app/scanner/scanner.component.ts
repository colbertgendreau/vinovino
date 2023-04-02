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
  uneBouteille: Imesbouteilles;
  private stream: MediaStream | null = null;
  iconeCamera =  environment.baseImg + 'icones/barcode-scan.png';

  @Output() scanned = new EventEmitter<any>();
  showVideo = false;

  constructor(
    public fetchService: FetchService,
    private router: Router
    ) {}

  startScan(): void {
    this.showVideo = true;
    console.log('apenas');
    let backCameraList = [];
    navigator.mediaDevices.enumerateDevices()
      .then(function(devices) {
        devices.forEach(function(device) {
          console.log('device - ' + JSON.stringify(device));
          alert('device - ' + JSON.stringify(device));alert('device - ' + JSON.stringify(device));
          if ( device.kind === 'videoinput' && device.label.match(/back/) != null ) {
            console.log('Back found! - ' + device.label);
            alert('Back found! - ' + device.label);
            backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
          }
        });
      }).then(
        () => {
          console.log('backCameraList: ' + JSON.stringify(backCameraList));
          console.log('aqui');
          if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            console.log('backCameraList: ' + JSON.stringify(backCameraList));
            navigator.mediaDevices.getUserMedia({video: {
                deviceId: { exact: backCameraList[backCameraList.length - 1]['deviceId'] },
                facingMode: { exact: "environment" }
              } })
              .then((stream) => {
                this.stream = stream;
                this.video.nativeElement.srcObject = stream;
                this.video.nativeElement.play();
                this.isScanning = true;
                Quagga.init({
                  inputStream: {
                    name: "Live",
                    type: "LiveStream",
                    target: this.video.nativeElement,
                    constraints: {
                      width: 640,
                      height: 480,
                      facingMode: 'environment',
                      deviceId: backCameraList[backCameraList.length - 1]['deviceId']
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
                    readers : ["code_128_reader"]
                  },
                  locate: true,
                  locator: {
                    halfSample: true,
                    patchSize: "large"
                  }
                }, (err) => {
                  if (err) {
                    console.error(err);
                    return;
                  }
                  Quagga.start();
                  this.isScanning = true;
                });
              })
              .catch((err) => {
                console.error(err);
              });
          }
        }
    );

  }

  stopScan(): void {

    if (this.isScanning) {
      this.showVideo = false;
      Quagga.stop();
      this.isScanning = false;
      if (this.stream) {
        this.stream.getTracks().forEach(track => track.stop());
        this.video.nativeElement.srcObject = null;
      }
    }
  }

  ngOnDestroy(): void {
    this.stopScan();
  }

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
    this.stopScan();



    this.fetchService.scannerDetail(result.codeResult.code).subscribe((data: any) => {
      this.uneBouteille = data.data;
      if(!this.uneBouteille){
        this.startScan();
      }
      console.log(this.uneBouteille);

      this.scanned.emit(this.uneBouteille);

      // if (this.uneBouteille && this.uneBouteille.vino__bouteille_id) {
      //   this.router.navigate(['/profil/bouteille', this.uneBouteille.vino__bouteille_id]);
      // }



      // this.spin = false;
      // this.hide = false;
    });



  }

  startScanTest(): void {
    this.showVideo = true;

    let backCameraList = [];
    navigator.mediaDevices.enumerateDevices()
      .then(function(devices) {
        devices.forEach(function(device) {
alert('device - ' + JSON.stringify(device));
          if ( device.kind === 'videoinput' && device.label.match(/back/) != null ) {
alert('Back found! - ' + device.label);
            backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
          }
        });

         alert('backCameraList: ' + JSON.stringify(backCameraList));
         alert('arrayLength: ' + backCameraList.length);
         alert('finalBackCamera: ' + JSON.stringify(backCameraList[backCameraList.length - 1], null, 2));
         alert('finalBackCameraId' + backCameraList[backCameraList.length - 1]['deviceId']);

        console.log(backCameraList);
        if (backCameraList.length > 0 && backCameraList[backCameraList.length - 1]['deviceId'] !== undefined) {
          Quagga.init({
            locator: {
              patchSize: 'medium',
              halfSample: false,
            },
            numOfWorkers: 1,
            locate: true,
            inputStream: {
              type: 'LiveStream',
              constraints: {
                width: 640,
                height:  480,
                deviceId: backCameraList[backCameraList.length - 1]['deviceId']
              },
              frequency: 10,
              singleChannel: true
            }
          }, (err: any) => {
            if (err) {
              return console.error(err);
            }
            Quagga.start();
            this.isScanning = true;
          });
        } else {
          Quagga.init({
            locator: {
              patchSize: 'medium',
              halfSample: false,
            },
            numOfWorkers: 1,
            locate: true,
            inputStream: {
              type: 'LiveStream',
              constraints: {
                width: 640,
                height:  480,
                facingMode: 'environment'
              },
              frequency: 10,
              singleChannel: true
            }
          }, (err: any) => {
            // if (err) {
            //   return console.error(err);
            // }
            Quagga.start();
            this.isScanning = true;
          });
        }

      })
      .catch(function(err) {
        console.log(err.name + ': ' + err.message);
      });
  }


  ngAfterViewInit(): void {
    Quagga.onDetected(this.handleDecode.bind(this));
  }
}
