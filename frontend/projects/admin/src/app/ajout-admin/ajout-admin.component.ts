import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AdminService } from '../admin.service';
import { IUser } from '../iuser';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

@Component({
  selector: 'app-ajout-admin',
  templateUrl: './ajout-admin.component.html',
  styleUrls: ['./ajout-admin.component.scss']
})

export class AjoutAdminComponent implements OnInit {

  utilisateur : IUser = {
    id : NaN,
    name : '',
    email : '',
    type : '1',
    password : '',
  }

  constructor(private route:ActivatedRoute, private adminServ:AdminService, private snackBar: MatSnackBar, private router:Router) {}

  ngOnInit(): void {}

  ajouter(message:string, action:string) {

    this.snackBar.open(message, action, { duration: 5000 });

    this.adminServ.ajouterUtilisateur(this.utilisateur).subscribe((retour)=>{
      this.utilisateur.name = this.utilisateur.name;
      this.utilisateur.email = this.utilisateur.email;
      this.utilisateur.password = this.utilisateur.password;
      this.utilisateur.type = this.utilisateur.type;
      console.log(retour);

      this.router.navigate(["/liste-usager"]);
    });
  }
}
