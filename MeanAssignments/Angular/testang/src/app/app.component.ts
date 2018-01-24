import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  reservecolors = ["Bisque", "CadetBlue", "DarkOliveGreen", "DarkSeaGreen", "White"];
  allcolors = [Math.floor(Math.random()*5),Math.floor(Math.random()*5),Math.floor(Math.random()*5),Math.floor(Math.random()*5),Math.floor(Math.random()*5)];
}
