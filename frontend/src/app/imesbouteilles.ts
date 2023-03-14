export interface Imesbouteilles {
    id?:number;
    prix?:number;
    celliers_id:number;
    id_bouteille:number;
    nom: string;
    type: number;
    pays: string;
    format: string;
    prix_saq: number;
    quantite: number;
    description: string;

    id_bouteillePerso: number;
    nom_bouteillePerso: string;
    type_bouteillePerso: number;
    pays_bouteillePerso: string;
    format_bouteillePerso: string;
    prix_bouteillePerso: number;
    quantite_bouteillePerso: number;
    description_bouteillePerso: string;

}
