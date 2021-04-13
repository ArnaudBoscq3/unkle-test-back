# CREATE 2 ADMINS
Admin.create(email: 'matthieu@unkle.', password:'unkle123')
Admin.create(email: 'johann@unkle.', password:'unkle123')

# CREATE 3 CLIENTS
Client.create(email: 'arnaud@gmail.com', password:"client123")
Client.create(email: 'camille@gmail.com', password:"client123")
Client.create(email: 'michel@gmail.com', password:"client123")

# CREATE 5 OPTIONS
Option.create(title:'Tous risques', description:"L'option «Tous Risques Immobilier» vous couvre même en cas d'évènements habituellement non pris en charge ou lorsqu'aucun responsable n'est identifié (chute d'un arbre, portail endommagé, etc.).")
Option.create(title:'Vol uniquement', description:"L'option «Vol uniquement» vous couvre contre le vol, commis par effraction, ruse et introduction clandestine.")
Option.create(title:'Incendie uniquement', description:"L'option «Incendie uniquement» vous couvre en cas d'incendie dans votre habitation")
Option.create(title:'Inondation uniquement', description:"L'option «Inondation uniquement» vous couvre en cas d'inondation dans votre habitation.")
Option.create(title:'Cambriolé un vendredi', description:"L'option «Cambriolé un vendredi» vous couvre en cas de cambriolage le vendredi dans votre habitation.")

# CREATE 5 CONTRACTS
Contract.create(number:'178654', start_date: Date.today - 10.days, status: 'active', client_ids: [1,2], option_ids:[1])
Contract.create(number:'267543', start_date: Date.today + 2.days, status: 'pending', client_ids: [2], option_ids:[2,3])
Contract.create(number:'376543', start_date: Date.today - 100.days, end_date: Date.today - 10.days, status: 'finsihed', client_ids: [2,3], option_ids:[3,4,5])
Contract.create(number:'198768', start_date: Date.today + 5.days, status: 'pending', client_ids: [1], option_ids:[2,4])
Contract.create(number:'198768', start_date: Date.today - 5.days, status: 'active', client_ids: [1,3], option_ids:[4,5])
