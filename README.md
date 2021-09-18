![Frame 1](https://user-images.githubusercontent.com/70981102/133642726-e629b398-335c-4cdd-a576-bcaec0fbfd5a.png)

On Tea Way is a tea subscription service that customizes tea packaging with images from the user. Users can either search for an image from the Unsplash API or upload their own. 

I built this API as part of my application to Shopify's BackEnd Engineering Internship Program. Currently, this is API only. 

### Schema 
<img width="940" alt="Screen Shot 2021-09-16 at 9 00 17 PM" src="https://user-images.githubusercontent.com/70981102/133783814-1bf10226-94ff-4f3c-8254-00ab42e307ef.png">

#### Versions

### Tech Stack 
<div display="inline-block"> 
 <img src="https://img.shields.io/badge/RAILS-CC0000?logo=rubyonrails&logoColor=fff&style=flat-square" alt="Rails Badge"> 
 <img src="https://img.shields.io/badge/CircleCI-343434?logo=circlecis&logoColor=fff&style=flat-square" alt="CircleCI Badge"> 
 <img src="https://img.shields.io/badge/GraphQL-E434AA?logo=graphql&logoColor=fff&style=flat-square" alt="GraphQL Badge"> 
 <img src="https://img.shields.io/badge/Heroku-430098?logo=heroku&logoColor=fff&style=flat-square" alt="Heroku Badge"> 
</div>

## GraphQL Endpoints 

### Queries 

userPhotos: returns all users in database 
``` graphql 
query {
  userPhotos(id: 1){
    id
    photos {
      id
      userUploaded
      unsplashId
      userPhotoUrl
    }
  }
}  
```

searchPhotos: returns photos that match query from Unsplash API

``` graphql 
query {
  searchPhotos(query: "puppy"){
      url
      unsplashId
      userUploaded
    }
  }
```
### Mutations

uploadUserPhoto: uploads User Photo 

``` graphql 
mutation($file: Upload!) {
   uploadUserPhoto(input: {
         upload: $file
         userId: 1
         }) {
              userId
              unsplashId
              userUploaded
            }
          }
```
