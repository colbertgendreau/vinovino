import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AdminService } from '../admin.service';
// import { IUser } from '../iuser';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';
import { AuthService } from 'projects/admin/src/app/shared/auth.service';


@Component({
  selector: 'app-ajout-admin',
  templateUrl: './ajout-admin.component.html',
  styleUrls: ['./ajout-admin.component.scss']
})

export class AjoutAdminComponent implements OnInit {

  isSignedIn! : boolean;
  isOpen : boolean = true;

  registerForm : FormGroup;
  errors: any = null;

  constructor(
    public router: Router,
    public fb: FormBuilder,
    public authService: AuthService,
    // private route: ActivatedRoute,
    // private adminServ:AdminService,
    private snackBar: MatSnackBar,
  ) {
    this.registerForm = this.fb.group({
      name: [''],
      email: [''],
      password: [''],
      password_confirmation: [''],
      type: ['1'],
    });
  }

  // utilisateur : IUser = {
  //   id : NaN,
  //   name : '',
  //   email : '',
  //   type : '1',
  //   password : '',
  // }

  // constructor(private route:ActivatedRoute, private adminServ:AdminService, private snackBar: MatSnackBar, private router:Router) {}

  ngOnInit() {}

  viderFormulaire() {
    this.registerForm = this.fb.group({
      name: [''],
      email: [''],
      password: [''],
      password_confirmation: [''],
      type: ['1'],
    });
  }

  ajouter(message:string, action:string) {

    // this.snackBar.open(message, action, { duration: 5000 });

    // this.adminServ.ajouterUtilisateur(this.utilisateur).subscribe((retour)=>{
    //   this.utilisateur.name = this.utilisateur.name;
    //   this.utilisateur.email = this.utilisateur.email;
    //   this.utilisateur.password = this.utilisateur.password;
    //   this.utilisateur.type = this.utilisateur.type;
    //   console.log(retour);

    //   this.router.navigate(["/liste-usager"]);
    // });

    console.log('Je suis à l\'intérieur de ajout-admin.component.ts')
    this.authService.register(this.registerForm.value).subscribe(
      (result) => {
        console.log(result);
      },
      (error) => {
        this.errors = error.error;
        this.errors = JSON.parse(this.errors);
      },
      () => {
        this.registerForm.reset();
        this.snackBar.open(message, action, { duration: 5000 });
        this.router.navigate(['admin/liste-usager']);
      }
    );
  }
}
