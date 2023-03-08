import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ICellier } from '../icellier';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { FetchService } from '../fetch.service';

// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-ajout-cellier',
  templateUrl: './ajout-cellier.component.html',
  styleUrls: ['./ajout-cellier.component.scss']
})

export class AjoutCellierComponent implements OnInit {
  @Input() cellier: ICellier;
  cellierForm: FormGroup;

  isSignedIn!: boolean;
  // title:string='Ajouter un cellier';
  UserProfile!: User;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private formBuilder: FormBuilder,
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
    this.cellierForm = this.formBuilder.group({
      nom: ['', [Validators.required]],
    });
  }

  ajouter() {
    if (this.cellierForm.valid) {
      let unCellier: ICellier = this.cellierForm.value;
      this.fetchService.ajoutCellier(unCellier).subscribe((retour) => {
        this.router.navigate(['liste-cellier']);
      });
    }
  }

}
