export class MyClass {
	fname:string;
    lname:string;
    email:string;
    pw:string;
    pwconf: string;
    street:string;
    city:string;
    unit:string;
    state:string;
    lucky:string;
    
	constructor(fname:string = "",
        lname:string = "",
        email:string = "",
        pw:string = "",
        pwconf: string = "",
        street:string = "",
        city:string = "",
        unit:string = "",
        state:string = "",
        lucky:string = ""){

		this.fname = fname;
        this.lname = lname;
		this.email = email;
        this.pw = pw;
        this.pwconf = pwconf;
		this.street = street;
        this.city = city;
		this.unit = unit;
        this.state = state;
		this.lucky = lucky;
        

	}

}
