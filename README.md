# Blocipedia
Blocipedia is a CRUD web application built with Ruby on Rails that allows authenticated users to create public and private markdown-based wikis based on their user role (standard or premium) and collaboration status. Read a case study about building this project on my portfolio website at [karaflaherty.com: Blocipedia](http://karaflaherty.com/blocipedia-information-sharing-through-markdown-based-wikis/).

### Sign up, sign in, sign out
Blocipedia uses the [Devise](https://github.com/plataformatec/devise) gem to handle user authentication. When users sign up, they'll choose a username and password as well as receive an email for account confirmation. Users cannot sign in before confirming their email. Once confirmed and signed in, users will have full access to their own wikis as well as all public wikis. When signed out, users will only be able to view the homepage. To read or update an existing wiki, or to create a new wiki, a user must be signed in.

### Standard users and public wikis
All users begin as standard users by default, which gives them access to all public wikis. Standard users can create as many public wikis as they want, and all other Blocipedia users will be able to read and update all public wikis. Each public wiki will show the user who created it.

### Premium users and private wikis
Blocipedia uses [Stripe](https://stripe.com/) integration to give users the option to pay a one-time $15 fee for an upgrade to a premium membership, which gives them the ability to create private wikis in addition to public wikis. Private wikis can only be read or updated by the creator of the wiki or other premium users whom the creator has designated as collaborators. Each private wiki will show the user who created it as well as all added collaborators.

### Collaborators
Blocipedia uses the [Pundit](https://github.com/elabs/pundit) gem to handle collaborators. Creators of private wikis can add or remove collaborators to their wikis as they please, and those collaborators will have the ability to read and update the private wiki. Standard users cannot be added as collaborators to private wikis and must upgrade to a premium account in order to collaborate.

### Administrators
Admin users have all the same privileges as standard and premium users with the additional ability to delete wikis. This gives admin users the full CRUD capabilities of creating, reading, updating and deleting all wikis, public or private. Administrators can also add or remove collaborators on private wikis.

Only the Blocipedia developer can add administrators. To upgrade any user to administrator status, run the Rails console from the command line and manually update the user's role. This can be done like so:

```
$ rails c
> User.find_by_username("<enter username here>").update_attribute :admin, true
```

### Markdown
Blocipedia uses the [Redcarpet](https://github.com/vmg/redcarpet) gem to parse Markdown syntax. This gives users the ability to format their wikis with headers, font styles, links, code and more.

---
This project was built for [Bloc's Web Development Program](https://www.bloc.io/).
