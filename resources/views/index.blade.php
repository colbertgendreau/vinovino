@forelse($bouteilles as $bouteille)
<span>{{ $bouteille->nom }}</span>
@empty
    <li class="text-danger">Aucun article trouver</li>
@endforelse