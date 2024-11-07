namespace cryptipedia.Repositories;

public class CryptidClassificationsRepository
{
  public CryptidClassificationsRepository(IDbConnection db)
  {
    _db = db;
  }
  private readonly IDbConnection _db;

  internal CryptidClassificationClassification CreateCryptidClassification(CryptidClassification cryptidClassificationData)
  {
    string sql = @"
    INSERT INTO 
    cryptid_classifications(cryptid_id, classification_id)
    VALUES(@CryptidId, @ClassificationId);

    SELECT
    classifications.*,
    cryptid_classifications.id AS cryptid_classification_id
    FROM cryptid_classifications
    JOIN classifications ON classifications.id = cryptid_classifications.classification_id
    WHERE cryptid_classifications.id = LAST_INSERT_ID() LIMIT 1;";

    return _db.Query<CryptidClassificationClassification>(sql, cryptidClassificationData).SingleOrDefault();
  }

  internal List<CryptidClassificationClassification> GetCryptidClassificationsByCryptidId(int cryptidId)
  {
    string sql = @"
    SELECT
    classifications.*,
    cryptid_classifications.id AS cryptid_classification_id
    FROM cryptid_classifications
    JOIN classifications ON classifications.id = cryptid_classifications.classification_id
    WHERE cryptid_classifications.cryptid_id = @cryptidId;";

    return _db.Query<CryptidClassificationClassification>(sql, new { cryptidId }).ToList();
  }

  internal CryptidClassification GetCryptidClassificationById(int cryptidClassificationId)
  {
    string sql = "SELECT * FROM cryptid_classifications WHERE id = @cryptidClassificationId LIMIT 1;";

    return _db.Query<CryptidClassification>(sql, new { cryptidClassificationId }).SingleOrDefault();
  }

  internal CryptidClassificationCryptid GetCryptidClassificationCryptidById(int cryptidClassificationId)
  {
    string sql = @"
    SELECT
    cryptids.*,
    cryptid_classifications.id AS cryptid_classification_id
    FROM cryptid_classifications
    JOIN cryptids ON cryptids.id = cryptid_classifications.cryptid_id
    WHERE cryptid_classifications.id = @cryptidClassificationId LIMIT 1;";

    return _db.Query<CryptidClassificationCryptid>(sql, new { cryptidClassificationId }).SingleOrDefault();
  }

  internal void DeleteCryptidClassification(int cryptidClassificationId)
  {
    string sql = "DELETE FROM cryptid_classifications WHERE id = @cryptidClassificationId LIMIT 1;";

    int rowsAffected = _db.Execute(sql, new { cryptidClassificationId });

    if (rowsAffected != 1) throw new Exception("DELETE FAILED");
  }

  internal List<CryptidClassificationCryptid> GetCryptidClassificationsByClassificationId(int classificationId)
  {
    string sql = @"
    SELECT
    cryptids.*,
    cryptid_classifications.id AS cryptid_classification_id,
    accounts.*
    FROM cryptid_classifications
    JOIN cryptids ON cryptids.id = cryptid_classifications.cryptid_id
    JOIN accounts ON accounts.id = cryptids.discoverer_id
    WHERE cryptid_classifications.classification_id = @classificationId
    ORDER BY cryptids.id;";

    return _db.Query(sql, (CryptidClassificationCryptid cryptid, Profile account) =>
    {
      cryptid.Discoverer = account;
      return cryptid;
    }, new { classificationId }).ToList();
  }
}
