CREATE TABLE
  IF NOT EXISTS accounts (
    id VARCHAR(255) NOT NULL PRIMARY key COMMENT 'primary key',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    name VARCHAR(255) COMMENT 'User Name',
    email VARCHAR(255) UNIQUE COMMENT 'User Email',
    picture VARCHAR(255) COMMENT 'User Picture'
  ) DEFAULT charset utf8mb4 COMMENT '';

CREATE TABLE
  cryptids (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name TINYTEXT NOT NULL,
    description TEXT NOT NULL,
    img_url TEXT NOT NULL,
    threat_level TINYINT UNSIGNED NOT NULL,
    size TINYINT UNSIGNED NOT NULL,
    discoverer_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (discoverer_id) REFERENCES accounts (id) ON DELETE CASCADE
  );

CREATE TABLE
  classifications (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    title VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    cryptid_img TEXT NOT NULL,
    terrain_img TEXT NOT NULL
  );

CREATE TABLE
  cryptid_classifications (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    cryptid_id INT NOT NULL,
    classification_id INT NOT NULL,
    FOREIGN KEY (cryptid_id) REFERENCES cryptids (id) ON DELETE CASCADE,
    FOREIGN KEY (classification_id) REFERENCES classifications (id) ON DELETE CASCADE,
    UNIQUE (cryptid_id, classification_id)
  );

DROP TABLE cryptid_classifications;

DROP TABLE classifications;

DROP TABLE cryptids;

INSERT INTO
  cryptids (
    name,
    description,
    img_url,
    threat_level,
    size,
    discoverer_id
  )
VALUES
  (
    'Sasquatch',
    'The Sasquatch, also known as Bigfoot, is a legendary creature that is said to inhabit the forests of North America. Descriptions of the creature vary, but it is generally depicted as a large, hairy, ape-like being that walks upright on two legs. Sightings of Sasquatch have been reported for centuries, but no definitive evidence of its existence has ever been found. The creature is known for its elusive nature, with reports often describing it as reclusive and shy, avoiding human contact whenever possible.',
    'https://images.unsplash.com/photo-1508430769587-99af194269f4?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    6,
    6,
    '65f87bc1e02f1ee243874743'
  ),
  (
    'El Chupacabra',
    'El Chupacabra is a mythical creature that originated in Latin American folklore. It is described as a reptilian creature with spikes along its back, large eyes, and sharp fangs. The name "Chupacabra" translates to "goat sucker," as it is said to attack livestock, particularly goats, and drain them of blood. Reports of Chupacabra sightings often include descriptions of the creature standing on two legs and having a monstrous, alien-like appearance.',
    'https://images.unsplash.com/photo-1543028526-4ece80c74467?q=80&w=2188&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    7,
    3,
    '670ff93326693293c631476f'
  ),
  (
    'Loch Ness Monster',
    "The Loch Ness Monster, affectionately known as 'Nessie', is a legendary aquatic creature said to inhabit Loch Ness, a large, deep freshwater loch in the Scottish Highlands. Descriptions of Nessie vary, but it is commonly depicted as a long-necked, serpentine creature with humps protruding from the water. Sightings of the Loch Ness Monster have been reported for over a thousand years, with the first recorded sighting dating back to 565 AD. Despite numerous expeditions and studies, no conclusive evidence of Nessie's existence has been found.",
    'https://images.unsplash.com/photo-1700163013798-1ff341dd3f9b?q=80&w=2181&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    4,
    10,
    '65f87bc1e02f1ee243874743'
  ),
  (
    'Mothman',
    "Mothman is a cryptid that was first reported in the small town of Point Pleasant, West Virginia, in the 1960s. Described as a large humanoid creature with glowing red eyes and large wings, Mothman is said to have the ability to fly at high speeds and hover silently in the air. Witnesses often report feelings of fear or dread when encountering the creature. Mothman gained widespread attention after being linked to the collapse of the Silver Bridge in 1967, an event that resulted in the deaths of 46 people.",
    'https://images.unsplash.com/photo-1693268113164-688941fb348f?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    10,
    7,
    '65f87bc1e02f1ee243874743'
  ),
  (
    'Flatwoods Monster',
    "The Flatwoods Monster, also known as the Braxton County Monster, is a cryptid that was reportedly sighted in the town of Flatwoods, West Virginia, in 1952. Witnesses described the creature as being tall and humanoid, with glowing eyes, a spade-shaped head, and a green, metallic body. The creature was said to emit a foul odor and move with a gliding motion. The sighting occurred after witnesses reported seeing a bright object streak across the sky and land in a nearby field, leading some to speculate that the Flatwoods Monster was an extraterrestrial being.",
    'https://images.unsplash.com/photo-1518348284893-5d31989ec994?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    8,
    8,
    '670ff93326693293c631476f'
  ),
  (
    'Jersey Devil',
    'The Jersey Devil is a legendary creature said to inhabit the Pine Barrens of southern New Jersey. Descriptions of the Jersey Devil vary, but it is commonly depicted as a kangaroo-like creature with the head of a goat, leathery wings, horns, small arms with clawed hands, and cloven hooves. According to folklore, the creature was born to a woman named Mother Leeds in 1735, who cursed her 13th child to become a devil. The Jersey Devil is said to have terrorized the region for centuries, with numerous sightings and reports of its eerie cries and hoofprints.',
    'https://images.unsplash.com/photo-1515536765-9b2a70c4b333?q=80&w=2194&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    9,
    4,
    '670ff93326693293c631476f'
  ),
  (
    'Mokele-mbembe',
    'Mokele-mbembe is a cryptid believed to inhabit the swamps and rivers of the Congo River basin in Central Africa. Described as a large, dinosaur-like creature, Mokele-mbembe is often compared to a sauropod, with a long neck and tail, and a body size similar to that of an elephant. Local legends and reports from explorers suggest that the creature is herbivorous and spends much of its time submerged in water. Despite numerous expeditions to locate Mokele-mbembe, no definitive evidence of its existence has been found.',
    'https://images.unsplash.com/photo-1632949107133-3f98267ae9ed?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    5,
    10,
    '670ff93326693293c631476f'
  ),
  (
    'Loveland Frog',
    "The Loveland Frog, also known as the Loveland Frogman, is a cryptid that was first reported in the town of Loveland, Ohio, in the 1950s. Descriptions of the creature vary, but it is generally depicted as a humanoid frog with leathery skin, webbed hands and feet, and a frog-like face. Witnesses have reported seeing the Loveland Frog near waterways, often at night. The creature is said to be able to walk on two legs and emit a musky odor. Despite multiple sightings over the years, no conclusive evidence of the Loveland Frog\'s existence has been found.",
    'https://images.unsplash.com/photo-1524538813-1d2e4e975e1c?q=80&w=2235&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    3,
    4,
    '670ff93326693293c631476f'
  ),
  (
    'Dr. Pepper',
    "Appearance: A mature, intelligent orangutan who wears a pair of circular glasses. His fur is a distinctive rusty red, and he's often seen with a thoughtful, wise expression.

Origin: Deep within the uncharted jungles of Borneo, Dr. Pepper was once a renowned primatologist who mysteriously transformed into an orangutan. Some say it was due to his extensive research into the medicinal properties of exotic plants, while others believe it was an ancient curse placed upon him by the jungle spirits.

Rumored Invention: It is whispered among the locals that Dr. Pepper stumbled upon a secret recipe while experimenting with various herbs and spices found in the jungle. This concoction, which he affectionately named 'Dr. Pepper,' became a legendary elixir known for its unique, invigorating taste.

Habitat: Dr. Pepper resides in a hidden laboratory nestled high in the treetops of Borneo. His lair is an intricate blend of natural foliage and human ingenuity, filled with ancient manuscripts, vials of mysterious liquids, and rudimentary scientific equipment.
",
    'https://media.tenor.com/SDslC4yLCv8AAAAe/monkey-sunglasses-on.png',
    10,
    4,
    '670ff93326693293c631476f'
  );

SELECT
  cryptids.*,
  accounts.*
FROM
  cryptids
  JOIN accounts ON accounts.id = cryptids.discoverer_id;

DROP TABLE classifications;

INSERT INTO
  classifications (title, description, terrain_img, cryptid_img)
VALUES
  (
    "terrestrial",
    "These cryptids are believed to inhabit land environments, such as forests, mountains, or deserts. They are often characterized by footprints, sounds, or sightings reported by people. These creatures might adapt well to terrestrial life, having behaviors and physical traits suited for their specific habitats.",
    "https://images.unsplash.com/photo-1446104838475-bc6508184f08?q=80&w=2352&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://www.pumpkin.care/wp-content/uploads/2022/07/04_pet_portraits_nena.png"
  ),
  (
    "aquatic",
    "These are cryptids that live in water bodies, like oceans, lakes, or rivers. They are often described through sightings, mysterious waves, or strange underwater sounds. Aquatic cryptids are typically adapted to their watery environments, displaying features that allow them to swim and survive underwater.",
    "https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.squarespace-cdn.com/content/v1/5b80290bee1759a50e3a86b3/1538772383438-SKUVJFZNXDY9S6BH9XO4/flatback+art.png?format=1000w"
  ),
  (
    "hominid",
    "These cryptids resemble human or primate forms. They are often reported to walk upright, have some degree of intelligence, and may exhibit behaviors similar to those of humans or apes. Hominid cryptids might be spotted in remote or inaccessible regions, making them particularly elusive.",
    "https://images.unsplash.com/photo-1514471244491-6fb96fcdf04f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGVzZXJ0fGVufDB8MHwwfHx8Mg%3D%3D",
    "https://i.pinimg.com/originals/bc/d7/c4/bcd7c46b7b87ce612a1c809c38794d94.png"
  ),
  (
    "flying",
    "These cryptids are known for their ability to fly or glide through the air. They are typically characterized by wings or other adaptations that allow for flight. Sightings often describe them moving swiftly through the skies, sometimes with unusual patterns or in eerie silence.",
    "https://images.unsplash.com/photo-1495933925743-bb94d1d4ea4c?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNreXxlbnwwfDB8MHx8fDI%3D",
    "https://www.kaytee.com/-/media/Project/OneWeb/Kaytee/US/wild-bird/bird_wild-png.png?h=719&iar=0&w=633&hash=BEA26F92A75539B33E2BC21013776606"
  );

SELECT
  COUNT(*)
FROM
  classifications;

SELECT
  classifications.*,
  cryptid_classifications.id AS cryptid_classification_id
FROM
  cryptid_classifications
  JOIN classifications ON classifications.id = cryptid_classifications.classification_id
WHERE
  cryptid_classifications.cryptid_id = 1;