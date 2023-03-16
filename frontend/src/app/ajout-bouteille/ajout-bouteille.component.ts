import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
// import {FormControl} from '@angular/forms';
// import {Observable} from 'rxjs';
import { IBouteille } from '../ibouteille';
import { FetchService } from '../fetch.service';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { Imesbouteilles } from '../imesbouteilles';
import { ActivatedRoute } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';

// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-ajout-bouteille',
  templateUrl: './ajout-bouteille.component.html',
  styleUrls: ['./ajout-bouteille.component.scss']
})

export class AjoutBouteilleComponent implements OnInit{
  
  isSignedIn!: boolean;
  // title:string='Ajouter une bouteille';
  UserProfile!: User;
  arrayBouteille:Array<IBouteille>;
  filteredData:any = [];
  searchTerm:any = '';
  selectedData:any = [];
  ajouterBouteilleForm: FormGroup;
  bouteille:IBouteille;
  nouvelleBouteille:Imesbouteilles;
  isDataSelected:boolean;

  formSubmitted = false;
  
  
  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService:FetchService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });

    this.arrayBouteille = [];
    
  }

  filterData(searchTerm: string) {
    if (searchTerm.length < 3) {
      this.filteredData = [];
    }else{

      this.filteredData = this.arrayBouteille.filter(item =>
        item.nom.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }
  }

  selectData(bouteille: any) {
    this.selectedData = bouteille;
    console.log(this.selectedData);
    
    this.ajouterBouteilleForm.patchValue({
      id:bouteille.id,
      nom: bouteille.nom,
      type: bouteille.type,
      format: bouteille.format,
      prix_saq: bouteille.prix_saq,
      pays: bouteille.pays,
      description: bouteille.description,
      quantite: 1,

    });
    this.filteredData = [];
    this.isDataSelected = true; // set the flag to true when data is selected
    console.log('isDataSelected:', this.isDataSelected); // add this line
  }

  onInputChange() {
    this.isDataSelected = false;
    
  }

  ajouter() {
    this.formSubmitted = true;
    if (this.ajouterBouteilleForm.valid) {
      this.route.params.subscribe((params) => {
        let nouvelleBouteille: Imesbouteilles = this.ajouterBouteilleForm.value;
        nouvelleBouteille.type = Number(nouvelleBouteille.type)
        
        nouvelleBouteille.celliers_id = params['id'];
        this.fetchService.ajoutBouteille(nouvelleBouteille).subscribe((retour) => {
          this.router.navigate(['cellier/'+nouvelleBouteille.celliers_id]);
        });
    });
    }
  }

  clearForm() {
    this.isDataSelected = false;
    const controls = this.ajouterBouteilleForm.controls;
    Object.keys(controls).forEach(controlName => {
      controls[controlName].setValue('');
    });
  
    this.searchTerm = '';
  }

  


  ngOnInit(): void {

    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });

    
    this.fetchService.getBouteilleSAQ().subscribe((response) => {
      this.arrayBouteille = response.data;
      console.log(this.arrayBouteille);
      
    });

    this.ajouterBouteilleForm = this.formBuilder.group({
      id: [''],
      nom: ['', [Validators.required]],
      type: [''],
      pays: [''],
      format: [''],
      prix_saq: [''],
      quantite: [1, [Validators.required, Validators.pattern(/^-?[0-9]+(\.[0-9]*)?$/)]],
      description: [''],
      

      
    });
  }


}
