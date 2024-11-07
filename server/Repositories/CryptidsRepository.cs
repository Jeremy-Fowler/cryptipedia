

namespace cryptipedia.Repositories;

public class CryptidsRepository
{
  private readonly IDbConnection _db;

  public CryptidsRepository(IDbConnection db)
  {
    _db = db;
  }

  internal List<Cryptid> GetAllCryptids()
  {
    string sql = @"
    SELECT
    cryptids.*,
    accounts.*
    FROM cryptids
    JOIN accounts ON accounts.id = cryptids.discoverer_id
    ORDER BY cryptids.id;";

    return _db.Query(sql, (Cryptid cryptid, Profile account) =>
    {
      cryptid.Discoverer = account;
      return cryptid;
    }).ToList();
  }

  internal Cryptid GetCryptidById(int cryptidId)
  {
    string sql = @"
    SELECT
      cryptids.*,
      accounts.*
    FROM 
      cryptids
    JOIN 
      accounts ON accounts.id = cryptids.discoverer_id
    WHERE 
      cryptids.id = @cryptidId;";

    return _db.Query(sql, (Cryptid cryptid, Profile account) =>
    {
      cryptid.Discoverer = account;
      return cryptid;
    }, new { cryptidId }).SingleOrDefault();
  }
}