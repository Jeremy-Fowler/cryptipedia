namespace cryptipedia.Models;

public class CryptidClassification : RepoItem<int>
{
  public int CryptidId { get; set; }
  public int ClassificationId { get; set; }
}

public class CryptidClassificationCryptid : Cryptid
{
  public int CryptidClassificationId { get; set; }
}

public class CryptidClassificationClassification : Classification
{
  public int CryptidClassificationId { get; set; }
}