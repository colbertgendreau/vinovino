import { Component, OnInit, AfterViewInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { filter } from 'rxjs/operators';
import { FetchService } from '../fetch.service';
import { Imesbouteilles } from '../imesbouteilles';

@Component({
  selector: 'app-mes-bouteilles',
  templateUrl: './mes-bouteilles.component.html',
  styleUrls: ['./mes-bouteilles.component.scss']
})
export class MesBouteillesComponent implements AfterViewInit {
  type: string;
  pays: string;
  orderObj: any;
  filteredData: any = [];
  filters: string[] = [];
  listeMesBouteilles: Array<Imesbouteilles>;
  constructor(private route: ActivatedRoute,
    public fetchService: FetchService,) {
    this.listeMesBouteilles = [];
    this.route.queryParamMap
      .subscribe((params) => {
        this.orderObj = { ...params.keys, ...params };
        this.type = this.orderObj.params.type
        this.pays = this.orderObj.params.pays
        if (this.type) {
          this.filterByType(this.type);
        }
        if (this.pays) {
          this.filterByCountry(this.pays);
        }
      }
      );
  }

  ngAfterViewInit() {
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
        } else {
          if (this.listeMesBouteilles[i].prix_bouteillePerso == null) {
            this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_saq;
          }
        }
      }
      if (this.type) {
        this.filterByType(this.type);
      }
      if (this.pays) {
        this.filterByCountry(this.pays);
      }
    });
  }

  /**
  *Filtrer les données de la liste des bouteilles en fonction du terme de recherche fourni.
  *Si la longueur du terme de recherche est inférieure à 3 caractères, la liste filtrée est vidée.
  *@param {string} searchTerm - Terme de recherche à utiliser pour filtrer les données
  */
  filterData(searchTerm: string) {
    if (searchTerm.length < 3) {
      this.filteredData = [];
    } else {
      this.filteredData = this.listeMesBouteilles.filter(item =>
        item.nom.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }
  }

  /**
   * Filtrer les données de la liste de bouteilles par type
   * @param {string} type - le type de vin à filtrer 
   */
  filterByType(type: string) {
    if (this.filteredData.length) {
      this.filteredData = this.filteredData.filter(bouteille =>
        bouteille.type_vino_name.toLowerCase().includes(type.toLowerCase()));
      this.filters.push(type);
    } else {
      this.filteredData = this.listeMesBouteilles.filter(bouteille =>
        bouteille.type_vino_name.toLowerCase().includes(type.toLowerCase()));
      this.filters.push(type);
    }
  }

  /**
   * Filtre la liste des bouteilles en fonction d'un pays donné
   * @param {string} pays - le pays à filtrer
   */
  filterByCountry(pays: string) {
    this.filteredData = this.listeMesBouteilles.filter(bouteille =>
      bouteille.pays == pays);
  }

  /**
   * Filtre les bouteilles par leur prix dans une plage donnée
   * @param {number} minPrice - la valeur minimale de prix pour filtrer les bouteilles
   * @param {number} maxPrice - la valeur maximale de prix pour filtrer les bouteilles
   */
  filterByPrice(minPrice: number, maxPrice: number) {
    this.filteredData = this.listeMesBouteilles.filter(bouteille =>
      bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
  }

  /**
   * Supprime un filtre de recherche de la liste des filtres appliqués et filtre les données en conséquence
   * @param {string} filter - Le filtre à supprimer
   */
  removeFilter(filter: string) {
    const index = this.filters.indexOf(filter);
    if (index !== -1) {
      this.filters.splice(index, 1);
      this.filteredData = this.listeMesBouteilles.filter(item => {
        return this.filters.every(filter => {
        });
      });
    }
  }

}
