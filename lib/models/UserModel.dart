class UserModel
{
   String? name;
   String? phone;
   String? email;
   String? password;
   String? uId;
   String? image;
   String? cover;
   String? bio;
   bool? IsEmailVerify;


   UserModel({
  this.name,
  this.phone,
  this.email,
  this.password,
      this.uId,
      this.image,
      this.cover,
      this.bio,
     this.IsEmailVerify,
});
   UserModel.fromjason(Map<String,dynamic>jason)
   {
      name=jason['name'];
      phone=jason['phone'];
      email=jason['email'];
      password=jason['password'];
      uId=jason['uId'];
      IsEmailVerify=jason['IsEmailVerify'];
      image=jason['image'];
      cover=jason['cover'];
      bio=jason['bio'];


   }
   Map<String,dynamic> toMap()
   {
      return {
      'name':name,
        'phone':phone,
         'email':email,
         'password':password,
         'uId': uId,
         'image':image,
         'cover':cover,
         'bio':bio,
         'IsEmailVerify':IsEmailVerify,


      };


   }




}