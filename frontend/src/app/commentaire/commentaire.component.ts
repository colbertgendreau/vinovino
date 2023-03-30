import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Imesbouteilles } from '../imesbouteilles';
import { FetchService } from '../fetch.service';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';

export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-commentaire',
  templateUrl: './commentaire.component.html',
  styleUrls: ['./commentaire.component.scss']
})
export class CommentaireComponent  implements OnInit{

  isSignedIn!: boolean;
  // title:string='Modifier la bouteille #';
  UserProfile!: User;

  commentaireForm: FormGroup;
  bouteille: Imesbouteilles;

  formSubmitted = false;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    public fetchService: FetchService,
    private snackBar: MatSnackBar

  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });
  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });

    this.commentaireForm = this.formBuilder.group({
      commentaires: ['', Validators.maxLength(500)],
    });
  }

  ajouterCommentaire(){
    this.formSubmitted = true;
    if(this.commentaireForm.valid){
      let commentaire = this.commentaireForm.value;
      console.log(commentaire);
      
    }
  }




}
