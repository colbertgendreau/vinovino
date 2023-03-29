import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailBouteilleComponent } from './detail-bouteille.component';

describe('DetailBouteilleComponent', () => {
  let component: DetailBouteilleComponent;
  let fixture: ComponentFixture<DetailBouteilleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailBouteilleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DetailBouteilleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
