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

@Component({
  selector: 'app-liste-catalogue',
  templateUrl: './liste-catalogue.component.html',
  styleUrls: ['./liste-catalogue.component.scss']
})
export class ListeCatalogueComponent implements OnInit {

  isSignedIn! : boolean;
  isOpen : boolean = true;

  utilisateurs : Array<IUser>;
  catalogueData: Array<ICatalogue>;
  heure_debut: string;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private adminServ:AdminService,
  ) {}

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
      // this.isOpen = !this.isOpen;
      // console.log(this.isOpen);
    });
  }

  // https://stackoverflow.com/questions/28646139/how-to-pass-javascript-date-to-laravel-4-api-timestamp
  generateDateToday(){
    let d = new Date()
    let year = d.getFullYear();
    let month = ("0" + (d.getMonth() + 1)).slice(-2);
    let day = ("0" + d.getDate()).slice(-2);
    let hour = ("0" + d.getHours()).slice(-2);
    let minutes = ("0" + d.getMinutes()).slice(-2);
    let seconds = ("0" + d.getSeconds()).slice(-2);
    return year + "-" + month + "-" + day + " "+ hour + ":" + minutes + ":" + seconds;
  }


  executerSaq(message:string, action:string) {
    let heure= {
      temps_debut: this.generateDateToday()
    };
    this.adminServ.executeSaq(heure).subscribe((catalogue)=>{
      console.log(catalogue)
    });

    // this.adminServ.getDonnesSaq().subscribe((catalogue)=>{
    //   console.log(catalogue.data)
    //   console.log(catalogue.message)
    //   this.utilisateurs = listeUtilisateur.data;
    //   this.utilisateurs.forEach(utilisateur => {
    //     utilisateur.created_at=utilisateur.created_at?.split("T")[0];
    //   });
    // });
  }

}
