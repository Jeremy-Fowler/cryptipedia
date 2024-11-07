
namespace cryptipedia.Repositories;

public class ClassificationsRepository
{
  public ClassificationsRepository(IDbConnection db)
  {
    _db = db;
  }

  private readonly IDbConnection _db;

  internal List<Classification> GetAllClassifications()
  {
    string sql = "SELECT * FROM classifications;";

    return _db.Query<Classification>(sql).ToList();
  }
  internal Classification GetRandomClassification()
  {
    string sql = "SELECT * FROM classifications ORDER BY RAND() LIMIT 1;";

    return _db.Query<Classification>(sql).SingleOrDefault();
  }

  internal Classification GetClassificationById(int classificationId)
  {
    string sql = "SELECT * FROM classifications WHERE id = @classificationId LIMIT 1;";

    return _db.Query<Classification>(sql, new { classificationId }).SingleOrDefault();
  }
}
