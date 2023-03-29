import { Component, OnInit } from '@angular/core';
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

@Component({
  selector: 'app-liste-catalogue',
  templateUrl: './liste-catalogue.component.html',
  styleUrls: ['./liste-catalogue.component.scss']
})

export class ListeCatalogueComponent implements OnInit {

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
    private _snackBar: MatSnackBar
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
    this.adminServ.executeSaq(dateString).subscribe((resultat)=>{
      console.log("se acabo el executeSAsQ")
      console.log(resultat.resultat);
      console.log(resultat);
    });
  }

  toggleBadgeVisibility() {
      this.hidden = true;
  }
}
