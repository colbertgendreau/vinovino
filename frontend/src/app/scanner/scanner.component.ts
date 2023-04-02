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

  @Output() scanned = new EventEmitter<any>();
  showVideo = false;

  constructor(
    public fetchService: FetchService,
    private router: Router
    ) {}

  ngOnInit(): void {
    console.log('apenas');
    navigator.mediaDevices.enumerateDevices()
      .then((devices) => {
        console.log('aqui');
        devices.forEach((device) => {
          alert('device - ' + JSON.stringify(device));
          if ( device.kind === 'videoinput' && device.label.match(/back/) != null ) {
            alert('Back found! - ' + device.label);
            console.log('deviceId: ', device.deviceId);
            this.backCameraList.push({'deviceLabel': device.label, 'deviceId': device.deviceId});
          }
        });
      });
    console.log(this.backCameraList);
    console.log('fin')
  }

  startScan(): void {
    this.showVideo = true;
    console.log('aqui ya casi')
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
      console.log('backCameraList: ' + JSON.stringify(this.backCameraList));
      navigator.mediaDevices.getUserMedia({video: {
          deviceId: { exact: this.backCameraList[this.backCameraList.length - 1]['deviceId'] },
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

  ngAfterViewInit(): void {
    Quagga.onDetected(this.handleDecode.bind(this));
  }
}
