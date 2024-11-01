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
    "Sasquatch",
    "Big hairy idiot that it not to be messed with",
    "https://images.unsplash.com/photo-1650624987739-6a8e65d17315?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbiUyMGluJTIwd29vZHN8ZW58MHx8MHx8fDA%3D",
    6,
    5,
    "670ff93326693293c631476f"
  ),
  (
    "Mothman",
    "Harbinger of disasters, likes bright lights",
    "https://images.unsplash.com/photo-1612412348142-7e79cee3c638?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW90aG1hbnxlbnwwfHwwfHx8MA%3D%3D",
    8,
    7,
    "670ff93326693293c631476f"
  );

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
    'Large ape-like creature reportedly seen in North American forests.',
    'http://example.com/sasquatch.jpg',
    5,
    9,
    1
  ),
  (
    'El Chupacabra',
    'Mythical creature reported in Latin America, known for sucking the blood of livestock.',
    'http://example.com/chupacabra.jpg',
    7,
    5,
    2
  ),
  (
    'Loch Ness Monster',
    'Legendary aquatic creature said to inhabit Loch Ness in Scotland.',
    'http://example.com/lochness.jpg',
    3,
    8,
    3
  ),
  (
    'Mothman',
    'Winged humanoid creature reportedly seen in Point Pleasant, West Virginia.',
    'http://example.com/mothman.jpg',
    4,
    6,
    4
  ),
  (
    'Flatwoods Monster',
    'Alien-like creature reportedly sighted in Flatwoods, West Virginia.',
    'http://example.com/flatwoods.jpg',
    5,
    7,
    5
  ),
  (
    'Jersey Devil',
    'Legendary creature from New Jersey folklore, described as a kangaroo-like figure with wings.',
    'http://example.com/jerseydevil.jpg',
    8,
    8,
    6
  ),
  (
    'Mokele-mbembe',
    'Dinosaur-like cryptid reported in the Congo River basin.',
    'http://example.com/mokelembembe.jpg',
    4,
    10,
    7
  ),
  (
    'Loveland Frog',
    'Human-like frog cryptid reportedly seen in Loveland, Ohio.',
    'http://example.com/lovelandfrog.jpg',
    2,
    4,
    8
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