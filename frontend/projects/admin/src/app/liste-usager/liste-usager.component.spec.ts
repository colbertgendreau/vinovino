import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeUsagerComponent } from './liste-usager.component';

describe('ListeUsagerComponent', () => {
  let component: ListeUsagerComponent;
  let fixture: ComponentFixture<ListeUsagerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListeUsagerComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListeUsagerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
