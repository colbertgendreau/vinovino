import { Component, OnInit, AfterViewInit, ViewChild  } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from 'projects/admin/src/app/shared/token.service';
import { AuthStateService } from 'projects/admin/src/app/shared/auth-state.service';
import { AuthService } from 'projects/admin/src/app/shared/auth.service';
import {MatTableDataSource} from "@angular/material/table";
import {AdminService} from "../admin.service";
import {IUser} from "../iuser";
import {ICatalogue} from "../icatalogue";
import {IDate} from "../idate";
import { MatSnackBar } from '@angular/material/snack-bar';



import {
  ScannerQRCodeConfig,
  ScannerQRCodeSelectedFiles,
  NgxScannerQrcodeService,
  ScannerQRCodeResult,
  NgxScannerQrcodeComponent
} from 'ngx-scanner-qrcode';
import { delay } from 'rxjs';


@Component({
  selector: 'app-liste-catalogue',
  templateUrl: './liste-catalogue.component.html',
  styleUrls: ['./liste-catalogue.component.scss']
})

export class ListeCatalogueComponent implements OnInit,AfterViewInit {

  public config: ScannerQRCodeConfig = {
    // fps: 1000,
    vibrate: 400,
    // isBeep: true,
    // decode: 'macintosh',
    deviceActive: 0, // Camera 1 active
    constraints: {
      audio: false,
      video: {
        width: window.innerWidth
      }
    }
  };

  public qrCodeResult: ScannerQRCodeSelectedFiles[] = [];
  public qrCodeResult2: ScannerQRCodeSelectedFiles[] = [];
  @ViewChild('action') action: NgxScannerQrcodeComponent;


  //Variable pour la barre de progression
  value: number = 0;
  loading: boolean = false;
  //fin variable pour la barre de progression
  isSignedIn! : boolean;
  isOpen : boolean = true;
  isExcuted : boolean = false;
  snack : boolean = false;
  buttonClicked = false;
  utilisateurs : Array<IUser>;
  catalogueData: Array<ICatalogue>;
  heure_debut: string;
  hidden: boolean = false;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private adminServ:AdminService,
    private _snackBar: MatSnackBar,
    private qrcode: NgxScannerQrcodeService
  ) {}

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
    // Initialisation des variables loading et value pour la barre de progression à partir de l'observable
    this.adminServ.loading$.subscribe((val) => {  this.loading = val; });
    this.adminServ.buttonClicked$.subscribe((val) => {  this.buttonClicked = val; });
    this.adminServ.hidden$.subscribe((val) => {  this.hidden = val; });
    this.adminServ.snack$.subscribe((val) => {  this.snack = val; });
    this.adminServ.progressValue$.subscribe((val) => {  this.value = val; });
  }

  executerSaq(message:string, action:string) {
    this.value= 0;
    this.buttonClicked = true;
    this.isExcuted=true;
    this.loading = true;
    if(this.hidden == true){
      this.hidden = false;
    }
    this.isExcuted = true;

    const now = new Date();
    const timezoneOffset = now.getTimezoneOffset() * 60000; // Convert minutes to milliseconds
    const localTime = now.getTime() - timezoneOffset;
    const localDate = new Date(localTime);
    const dateString = localDate.toISOString().slice(0, 19).replace('T', ' ');

    this._snackBar
      .open(
        'La mise à jour a commencée, cette action peut prendre entre 20 et 30 minutes.',
        'Close', { duration: 6000 });
    this.adminServ.executeSaq(dateString,0).subscribe((resultat)=>{
      console.log("se acabo el executeSAsQ")
      console.log(resultat.resultat);
      console.log(resultat);
    });
  }

  executerSaqDetails(message:string, action:string) {
    this.value= 0;
    this.buttonClicked = true;
    this.isExcuted=true;
    this.loading = true;
    if(this.hidden == true){
      this.hidden = false;
    }
    this.isExcuted = true;

    const now = new Date();
    const timezoneOffset = now.getTimezoneOffset() * 60000; // Convert minutes to milliseconds
    const localTime = now.getTime() - timezoneOffset;
    const localDate = new Date(localTime);
    const dateString = localDate.toISOString().slice(0, 19).replace('T', ' ');

    this._snackBar
      .open(
        'La mise à jour des details à commencée, cela peut prendre entre 20 et 30 minutes.',
        'Close', { duration: 6000 });
    this.adminServ.executeSaq(dateString,1).subscribe((resultat)=>{
      console.log("se acabo el executeSAsQ")
      console.log(resultat.resultat);
      console.log(resultat);
    });
  }

  toggleBadgeVisibility() {
      this.hidden = true;
  }

  ngAfterViewInit(): void {
    this.action.isReady.pipe(delay(1000)).subscribe(() => {
      this.action.start()
    });
  }

  public onEvent(e: ScannerQRCodeResult[]): void {
    console.log(e);
  }

  public handle(action: any, fn: string): void {
    action[fn]().subscribe(console.log, alert);
  }

  public onDowload(action): void {
    action.download().subscribe(console.log, alert);
  }

  public onSelects(files: any): void {
    this.qrcode.loadFiles(files).subscribe((res: ScannerQRCodeSelectedFiles[]) => {
      this.qrCodeResult = res;
    });
  }

  public onSelects2(files: any): void {
    this.qrcode.loadFilesToScan(files, this.config).subscribe((res: ScannerQRCodeSelectedFiles[]) => {
      console.log(res);
      this.qrCodeResult2 = res;
    });
  }


}
