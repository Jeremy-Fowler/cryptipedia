using System.ComponentModel.DataAnnotations;

namespace cryptipedia.Models;

public class Cryptid : RepoItem<int>
{
  [MaxLength(100)]
  public string Name { get; set; }
  [MaxLength(3000)]
  public string Description { get; set; }
  [Url, MaxLength(3000)]
  public string ImgUrl { get; set; }
  [Range(0, 10)]
  public uint ThreatLevel { get; set; }
  [Range(0, 10)]
  public uint Size { get; set; }
  public string DiscovererId { get; set; }
  public Profile Discoverer { get; set; }
}

