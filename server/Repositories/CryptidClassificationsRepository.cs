


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
}
