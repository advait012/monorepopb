import {firstName, lastName} from '@monorepopb/user';


class Auth { 


  showName(): string 
  { 
       const fullname: string = firstName + " " +  lastName; 
      return fullname; 
  };

}
  
  export {Auth};