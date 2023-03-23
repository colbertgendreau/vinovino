import { Component, Input, Output, EventEmitter, OnInit, ViewChild  } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FetchService } from '../fetch.service';
import { ActivatedRoute } from '@angular/router';
import { IlisteCellier } from '../iliste-cellier';
import { ICellier } from '../icellier';
// import { EffacerModalComponent } from '../effacer-modal/effacer-modal.component';
import { Ilistemesbouteilles } from '../ilistemesbouteilles';
import { Imesbouteilles } from '../imesbouteilles';

@Component({
  selector: 'app-recherche',
  templateUrl: './recherche.component.html',
  styleUrls: ['./recherche.component.scss']
})
export class RechercheComponent {

  listeMesBouteilles: Array<Imesbouteilles>;
  unCellier: ICellier;
  @Input() isVisibleM = false;
  @Output() closed = new EventEmitter<void>();
  filteredData:any = [];
  searchTerm:any = '';
  id: number;
  isVisible = false;
  choixTypes: string[] = ['Vin rouge', 'Vin blanc', 'Vin rosé'];
  choixPays: string[] = ['Tout les pays','Canada', 'États-Unis', 'France', 'Australie', 'Italie', 'Espagne', 'Chili', 'Portugal', 'Argentine', 'Afrique du Sud', 'Allemagne', 'Autriche', 'Grèce', 'Nouvelle-Zélande', 'Israël', 'Liban', 'Hongrie', 'Roumanie', 'Uruguay', 'Arménie', 'Géorgie', 'Slovénie', 'Moldavie', 'Suisse', 'Bulgarie', 'Chine', 'Luxembourg', 'Mexique', 'Brésil', 'Croatie', 'Maroc', 'République Tchèque'];
  selectedWineTypes = new Set<string>();
  selectedWinePays = '';
  minPrice = '';
  maxPrice = '';
  
  imgBouteilleNonDisponible = environment.baseImg + 'img/nonDispo.webp';


  isSelected(type: string): boolean {
    return this.selectedWineTypes.has(type);
  }

  isSelectedPays(pays: string): boolean {
    return this.selectedWinePays === pays;
  }

  iconeTrash = '../assets/icones/trash-347.png';
  iconeModif = '../assets/icones/edit-black.png';

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private route: ActivatedRoute,
  ) {

  }

  ngOnInit() {
  this.fetchService.getMesBouteilles().subscribe((data: any) => {
    this.listeMesBouteilles = data.data;
    for (let i = 0; i < this.listeMesBouteilles.length; i++) {
      if (this.listeMesBouteilles[i].nom == null) {
        this.listeMesBouteilles[i].nom = this.listeMesBouteilles[i].nom_bouteillePerso
      }
      if (this.listeMesBouteilles[i].type_vino_name == null) {
        this.listeMesBouteilles[i].type_vino_name = this.listeMesBouteilles[i].type_mes_name
      }
      if (this.listeMesBouteilles[i].pays == null) {
        this.listeMesBouteilles[i].pays = this.listeMesBouteilles[i].pays_bouteillePerso
      }
      if (this.listeMesBouteilles[i].prix_saq == null) {
        this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_bouteillePerso
      }else{
        if (this.listeMesBouteilles[i].prix_bouteillePerso == null) {
          this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_saq;
        }
      }
    }
    console.log(this.listeMesBouteilles);
  });


  

}

  filterData(searchTerm: string) {
    console.log(searchTerm);
    
    if (searchTerm.length < 1) {
      this.filteredData = [];
    } else {
      this.filteredData = this.listeMesBouteilles.filter(item =>
        item.nom.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }
  }


  updateSelectedWineTypes(checked: boolean, type: string) {
    if (checked) {
      this.selectedWineTypes.add(type);
    } else {
      this.selectedWineTypes.delete(type);
    }
    this.filtreUltime();
  }
  
  updateSelectedWinePays(value: string) {
    this.selectedWinePays = value;
    this.filtreUltime();
  }
  
  filterByPrice(minPrice: string, maxPrice: string) {
    this.minPrice = minPrice;
    this.maxPrice = maxPrice;
    this.filtreUltime();
  }
  
  filtreUltime() {
    this.filteredData = this.listeMesBouteilles.filter((item: any) => {
      return (
        (this.selectedWineTypes.size === 0 || this.selectedWineTypes.has(item.type_vino_name)) &&
        (this.selectedWinePays === '' || this.selectedWinePays === 'Tout les pays' || item.pays === this.selectedWinePays) &&
        (this.minPrice === '' || item.prix >= parseInt(this.minPrice)) &&
        (this.maxPrice === '' || item.prix <= parseInt(this.maxPrice)) &&
        (item.nom.toLowerCase().includes(this.searchTerm.toLowerCase()))
      );
    });
  }
}
