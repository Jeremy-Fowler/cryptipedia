using System.ComponentModel.DataAnnotations;

namespace cryptipedia.Models;

public class Classification : RepoItem<int>
{
  public string Title { get; set; }
  [MaxLength(5000)]
  public string Description { get; set; }
  [Url, MaxLength(3000)]
  public string CryptidImg { get; set; }
  [Url, MaxLength(3000)]
  public string TerrainImg { get; set; }
}