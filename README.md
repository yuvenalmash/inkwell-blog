<a name="readme-top"></a>

<div align="center">
  <h3><b>Inkwell-blog Readme</b></h3>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [API Documentation](#api-documentation)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Inkwell-blog <a name="about-project"></a>

**Inkwell-blog** is a blog application that allows users to create, read, update, and delete blog posts. Users can also comment on blog posts and like/dislike blog posts.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Framework</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>
- **web application**
  - Users can create, read, update, and delete blog posts.
  - Users can comment on blog posts.
  - Users can like/dislike blog posts.

- **API**
  - Users can create, read, update, and delete blog posts.
  - Users can comment on blog posts.
  - Users can like/dislike blog posts.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:
- install ruby
```sh
  sudo apt-get install ruby-full
```
- install rails
```sh
 gem install rails
```
- install postgresql
```sh
  sudo apt-get install postgresql postgresql-contrib libpq-dev
```

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:yuvenalmash/inkwell-blog.git
```
Prepare the database:
- create user and password
```sh
  sudo -u postgres createuser -s inkwell_blog -P
```
- Add password to env file
```sh
  echo "DB_PASSWORD=[your_password]" >> .env
  source .env
```
- create database
```sh
  rails db:create
  rails db:migrate
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- API DOCUMENTATION -->

## API Documentation <a name="api-documentation"></a>

### API Endpoints

#### Prefix

- '/api/v1'

#### Users

- 'GET /users' - Get all users
- 'GET /users/:id' - Get a user
- 'POST /users' - Create a user
- 'PATCH /users/:id' - Update a user
- 'DELETE /users/:id' - Delete a user

#### Posts

- 'GET /users/:user_id/posts' - Get all posts for a user
- 'GET /users/:user_id/posts/:id' - Get a post for a user
- 'POST /users/:user_id/posts' - Create a post for a user
- 'PATCH /users/:user_id/posts/:id' - Update a post for a user
- 'DELETE /users/:user_id/posts/:id' - Delete a post for a user

#### Comments

- 'GET /users/:user_id/posts/:post_id/comments' - Get all comments for a post
- 'GET /users/:user_id/posts/:post_id/comments/:id' - Get a comment for a post
- 'POST /users/:user_id/posts/:post_id/comments' - Create a comment for a post
  ```json
  {
    "text": "This is a comment",
    "user_id": 1,
    "post_id": 1
  }
  ```
- 'PATCH /users/:user_id/posts/:post_id/comments/:id' - Update a comment for a post
- 'DELETE /users/:user_id/posts/:post_id/comments/:id' - Delete a comment for a post

#### Likes

- 'GET /users/:user_id/posts/:post_id/likes' - Get all likes for a post
- 'GET /users/:user_id/posts/:post_id/likes/:id' - Get a like for a post
- 'POST /users/:user_id/posts/:post_id/likes' - Create a like for a post
- 'PATCH /users/:user_id/posts/:post_id/likes/:id' - Update a like for a post
- 'DELETE /users/:user_id/posts/:post_id/likes/:id' - Delete a like for a post


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Yuvenal Njoroge**

- GitHub: [@githubhandle](https://github.com/yuvenalmash)
- Twitter: [@twitterhandle](https://twitter.com/_Juvenal_)
- LinkedIn: [LinkedIn](https://linkedin.com/in/yuvenal-njoroge)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Upgrade UI**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project give it a star ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank microverse for giving me the opportunity to learn and grow as a developer.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
